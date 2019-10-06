class HomeController < ApplicationController
  
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  
  def index
    flash[:notice] = "kk"
    @a = Advertiser.first
  end
  
  def login
    
    if params[:email]
      
      @advertiser = Advertiser.find_by(email: params[:email])
      @podcaster = Podcaster.find_by(email: params[:email])
      @error_messages = []
      if params[:email] == ""
        @error_messages.push("メールアドレスを入力してください")
      end
      if params[:password] == ""
        @error_messages.push("パスワードを入力してください")
      end
      
      
      # 広告主
      if Advertiser.find_by(email: params[:email])
        user = Advertiser.find_by(email: params[:email])
        if user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to('/myaccount')
        else
          @error_messages.push("パスワードが違います")
          render action: :login
        end
        
      # 番組ホスト
      elsif Podcaster.find_by(email: params[:email])
        user = Podcaster.find_by(email: params[:email])
        if user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to('/myaccount')
        else
          @error_messages.push("パスワードが違います")
          render action: :login
        end
        
      else
        render action: :login
      end
      
      
      
      if @advertiser
        if @advertiser.errors.any?
          @errors = @advertiser.errors
        end
      end
      if @podacster
        if @podcaster.errors.any?
          @errors = @podcaster.errors
        end
      end
      
      # binding.pry
      
    end
    
  end
    
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end
  
  def myaccount
    
    if @current_user_ad
      @advertiser = Advertiser.find_by(id: @current_user_ad.id)
      @user = @advertiser
      @deals = Deal.where(advertiser_id: @user.id)
    elsif @current_user_pod
      @podcaster = Podcaster.find_by(id: @current_user_pod.id)
      @user = @podcaster
      @deals = Deal.where(podcaster_id: @user.id)
    end
    
  end

  def edit_profile
    
    if @current_user_ad
      @advertiser = Advertiser.find_by(id: @current_user_ad.id)
      @advertiser.update(account_params)
    elsif @current_user_pod
      @podcaster = Podcaster.find_by(id: @current_user_pod.id)
      @podcaster.update(account_params)
    end

    redirect_to('/myaccount')
    
  end
  
  def delete_account
    
    if @current_user_ad
      @advertiser = Advertiser.find_by(id: @current_user_ad.id)
      @advertiser.destroy
    elsif @current_user_pod
      @podcaster = Podcaster.find_by(id: @current_user_pod.id)
      @podcaster.destroy
    end
    
    redirect_to('/')
    
  end
    


  def contact
    @contact = Contact.new
  end
  
  def contact_send
    
    @contact = Contact.new(
      name: params[:name],
      email: params[:email],
      content: params[:content]
      )
    if @contact.save
      flash[:notice] = "お問い合わせありがとうございます"
      redirect_to('/')
    else
      render action: :contact
    end
    
  end
  
  def account_params
    if @current_user_ad
      params.require(:advertiser).permit(:name,:company_name, :email,:password)
    elsif @current_user_pod
      params.require(:podcaster).permit(:name,:podcast_name,:email,:password)
    end
  end
  
  
end
