class AdvertiserController < ApplicationController
    
    def advertiser
    end
  
    def new
      @advertiser = Advertiser.new
      @a = Advertiser.first
    end
    
    def main_new
      @advertiser = Advertiser.new
      
    end
  
    
    def create
      
      # if Advertiser.find_by(email: params[:email])
      #   @error_message = "このメールアドレスは使用されています"
      #   redirect_to root_path
      # elsif Podcaster.find_by(email: params[:email])
      #   @error_message = "このメールアドレスは使用されています"
      #   redirect_to root_path
      # end
      
      @advertiser = Advertiser.new(
        name: params[:name],
        company_name: params[:company_name],
        email: params[:email]
      )
      if @advertiser.save
        session[:user_id] = @advertiser.id
        redirect_to root_path
      else
        @error_message ="登録に失敗しました"
        render(new_advertiser_path)
      end
    end
    
    
 
    
end
