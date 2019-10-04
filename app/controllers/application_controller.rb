class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
  
  def set_current_user

    if Advertiser.find_by(id: session[:user_id])
      @current_user_ad = Advertiser.find_by(id: session[:user_id])
    elsif Podcaster.find_by(id: session[:user_id])
      @current_user_pod = Podcaster.find_by(id: session[:user_id])
    end

  end
  
  
  def forbid_login_user
    if @current_user_ad or @current_user_pod
      flash[:notice] = "すでにログインしているためこのアクションは行えません"
      redirect_to("/myaccount")
    end
  end
  
  
  
  
  
end
