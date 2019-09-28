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
  
  
  
  
  
end
