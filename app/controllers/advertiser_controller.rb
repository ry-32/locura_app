class AdvertiserController < ApplicationController
    
    before_action :forbid_login_user, {only: [:new,:create]}
    
    
    
    def advertiser
    end
  
    def new
      @advertiser = Advertiser.new
    end
    
    def main_new
      @advertiser = Advertiser.new
      @deal_request = DealRequest.new
    end
  
    
    def create
      
      @advertisers = Advertiser.all
      @advertiser = Advertiser.new(account_params)
      
      a = Advertiser.uniqueness_of_a_property_across_models(@advertiser,account_params[:email])
      
      if a == true
        @error_message = "このメールアドレスは使用されています"
        return render :action => 'new'
      end

      if @advertiser.save
        session[:user_id] = @advertiser.id
        flash[:notice] = "ご登録が完了しました"
        redirect_to root_path
      else
        render action: :new
      end
    end
    
    
    
    def deal_request
      @deal_request = DealRequest.new(deal_params)
      if @deal_request.save
        flash[:notice] = "案件チームが確認し、すぐにご返答いたしますので少々お待ちください"
        redirect_to root_path
      else
        render action: :main_new
        # redirect_to '/advertiser-register'
      end
    end

    
    def account_params
      params.require(:advertiser).permit(:name, :company_name, :email,
      :password,:industry)
    end
    
    def deal_params
      params.require(:deal_request).permit(:name, :company_name, :email,
      :industry, :memo, :status)
    end
    
 
    
end
