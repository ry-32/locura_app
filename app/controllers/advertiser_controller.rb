class AdvertiserController < ApplicationController
    
    def advertiser
    end
  
    def new
        @advertiser = Advertiser.new
    end
    
    def main_new
      @advertiser = Advertiser.new
    end
  
    
    def create
        @advertiser = Advertiser.new(
          name: params[:name],
          company_name: params[:company_name],
          email: params[:email]
        )
        if @advertiser.save
        #   session[:user_id] = @user.id
          redirect_to new_advertiser_path
        else
          @error_message ="登録に失敗しました"
          
          render(new_advertiser_path)
        end
    end
    
    
end
