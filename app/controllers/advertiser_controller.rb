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
      
      @advertisers1 = Advertiser.all
      @advertiser = Advertiser.new(account_params)
      
      a = Advertiser.uniqueness_of_a_property_across_models(@advertiser,account_params[:email])
      
      if a == true
        @error_message = "このメールアドレスは使用されています"
        return render :action => 'new'
      end

      if @advertiser.save
        session[:user_id] = @advertiser.id
        redirect_to root_path
      else
        render action: :new
      end
      
      
    end
    
    
    def account_params
      params.require(:advertiser).permit(:name, :company_name, :email,:password)
    end
    
    
 
    
end
