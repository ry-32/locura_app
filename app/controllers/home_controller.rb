class HomeController < ApplicationController
  
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  
  def index
    @a = Advertiser.first
  end
  
  def login_form
  end
  
  def login
    
    @advertiser = Advertiser.find_by(email: params[:email])
    @podcaster = Podcaster.find_by(email: params[:email])
    @error_messages = []

    
    # 広告主
    if @advertiser
      if @advertiser.authenticate(params[:password])
        session[:user_id] = @advertiser.id
        flash[:notice] = "ログインしました"
        redirect_to('/myaccount')
      else
        @error_messages.push("パスワードが違います")
        render action: :login_form
      end
      
    # 番組ホスト
    elsif @podcaster
      if @podcaster.authenticate(params[:password])
        session[:user_id] = @podcaster.id
        flash[:notice] = "ログインしました"
        redirect_to('/myaccount')
      else
        @error_messages.push("パスワードが違います")
        render action: :login_form
      end
      
    elsif params[:email] == "" or params[:password] == ""
    
      if params[:email] == ""
        @error_messages.push('メールアドレスを入力してください')
      end
      if params[:password] == ""
        @error_messages.push('パスワードを入力してください')
      end
      
      render action: :login_form
      
    else
      render action: :login_form
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
    
    @program = Program.find_by(host_id: @podcaster.id)
    
    
  end
  
  def edit_program_info
    
    @podcaster = @current_user_pod
    @program = Program.find_by(host_id: @podcaster.id)
    @program.update(program_params)
    redirect_to('/myaccount')
    
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
    
    @contact = Contact.new(contact_params)
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
  
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
  
  def program_params
    params.require(:program).permit(:name, :description, :genre, :dl, :hosting,
    :start_date, :host_id, :program_url, :hp_url, :cpm_30_pre, :cpm_60_pre,
    :cpm_30_mid, :cpm_60_mid, :cpm_30_post, :cpm_60_post)
  end
  
  
end
