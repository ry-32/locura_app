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
      
      @advertiser = Advertiser.new(account_params)
      
      if Advertiser.find_by(email: account_params[:email])
        @error_message = "このメールアドレスは使用されています"
      # elsif Podcaster.find_by(email: account_params[:email])
      #   @error_message = "このメールアドレスは使用されています"
      end
      
      if @advertiser.save
        session[:user_id] = @advertiser.id
        redirect_to root_path
      else
        @error_message ="登録に失敗しました"
        render action: :new
      end
      
    end
    
    
    def account_params
      params.require(:advertiser).permit(:name, :company_name, :email)
    end
    
    
 
    
end
