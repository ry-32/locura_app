class PodcasterController < ApplicationController
  
  before_action :forbid_login_user, {only: [:new,:create]}
    
  def podcaster
  end

  def new
    @podcaster = Podcaster.new
  end
  
  def main_new
    @podcaster = Podcaster.find_by(id: @current_user_pod)
  end
  
  
  def create
    
    @podcaster = Podcaster.new(account_params)
    
    is_email_unique = Podcaster.uniqueness_of_a_property_across_models(account_params[:email])
    
    if is_email_unique == true
      @error_message = "このメールアドレスは使用されています"
      return render :action => 'new'
    end
    
    if @podcaster.save
      session[:user_id] = @podcaster.id
      redirect_to root_path
    else
      render(new_podcaster_path)
    end
  end
  
  def update
      @podcaster = Podcaster.find_by(id: @current_user_pod.id)
      @podcaster.update(account_params)
      
      if @podcaster.save
        flash[:notice] = "情報を更新しました"
        redirect_to '/myaccount'
      else
        render action: :main_new
      end
  end
  
  def account_params
    params.require(:podcaster).permit(:name, :email, :podcast_name,
    :password,:genre, :description, :url, :hosting, :memo)
  end
    
    
    
end
