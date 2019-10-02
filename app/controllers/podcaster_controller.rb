class PodcasterController < ApplicationController
    
    def podcaster
    end
  
    def new
      @podcaster = Podcaster.new
    end
    
    def main_new
      @podcaster = Podcaster.new
    end
    
    
    def create
      
      @podcaster = Podcaster.new(account_params)
      
      is_email_unique = Podcaster.uniqueness_of_a_property_across_models(account_params[:email])
      
      if is_email_unique == true
        @error_message = "this email is taken"
        return render :action => 'new'
      end
      
      if @podcaster.save
        session[:user_id] = @podcaster.id
        redirect_to root_path
      else
        @error_message ="登録に失敗しました"
        render(new_podcaster_path)
      end
    end
    
  def account_params
    params.require(:podcaster).permit(:name, :email, :podcast_name, :password)
  end
    
    
    
end
