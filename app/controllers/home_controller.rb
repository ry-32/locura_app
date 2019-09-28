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
          @message = "ログインに成功しました"
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
          @message = "ログインに成功しました"
          render action: :login
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
    
  def myaccount
    
    @a = Advertiser.first
  end
  
  def update
    @a = Advertiser.first
    @a.name = params[:name]
    @a.save
    redirect_to("/myaccount")
  end
    
    

end
