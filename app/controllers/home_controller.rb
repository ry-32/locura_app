class HomeController < ApplicationController
  
  def index
    @a = Advertiser.first
  end
  
  def login
    
    if params[:name]
      
      # 広告主
      if Advertiser.find_by(name: params[:name])
        user = Advertiser.find_by(name: params[:name])
        if user.email == params[:email]
          session[:user_id] = user.id
          redirect_to('/')
          # render action: :login
        else
          @message = "emailが違います"
          render action: :login
        end
        
      # 番組ホスト
      elsif Podcaster.find_by(name: params[:name])
        user = Podcaster.find_by(name: params[:name])
        if user.email == params[:email]
          session[:user_id] = user.id
          redirect_to('/')
        else
          @message = "emailが違います"
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
    @advertiser = Advertiser.new
    @a = Advertiser.first
  end
  
  def update
    @a = Advertiser.first
    @a.name = account_params
    @a.save
    @new_name = params[:name]
    redirect_to("/myaccount")
  end
    
    
  def account_params
    params.require(:advertiser).permit(:name,:company_name, :email)
  end
    

end
