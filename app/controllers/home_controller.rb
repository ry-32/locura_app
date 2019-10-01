class HomeController < ApplicationController
  
  def index
    @a = Advertiser.first
  end
  
  def login
    
    if params[:email]
      
      # 広告主
      if Advertiser.find_by(email: params[:email])
        user = Advertiser.find_by(email: params[:email])
        if user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to('/')
          # render action: :login
        else
          @message = "パスワードが違います"
          render action: :login
        end
        
      # 番組ホスト
      elsif Podcaster.find_by(email: params[:email])
        user = Podcaster.find_by(email: params[:email])
        if user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to('/')
        else
          @message = "パスワードが違います"
          render action: :login
        end
        
      else
        @message = "ログインに失敗しました"
        render action: :login
      end
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
    elsif @current_user_pod
      @podcaster = Podcaster.find_by(id: @current_user_pod.id)
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
