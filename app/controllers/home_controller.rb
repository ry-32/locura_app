class HomeController < ApplicationController
  def index
    @a = Advertiser.first
  end
  
  def login
    
    if params[:name]
      if Advertiser.find_by(name: params[:name])
        user = Advertiser.find_by(name: params[:name])
        if user.email == params[:email]
          @message = "ログインに成功しました"
          render action: :login
        else
          @message = "emailが違います"
          render action: :login
        end
      
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
    
    
    
    def myaccount
      
      @a = Advertiser.first
      @pd = Podcaster.first
      
      
    end
    
    
    
    
    
  end
  

end
