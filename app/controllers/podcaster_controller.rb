class PodcasterController < ApplicationController
    
    def podcaster
    end
  
    def new
        @podcaster = Podcaster.new
    end
    
    
    def create
        @podcaster = Podcaster.new(
          name: params[:name],
          podcast_name: params[:podcast_name],
          email: params[:email]
        )
        if @podcaster.save
          redirect_to root_path
        else
          @error_message ="登録に失敗しました"
          
          render(new_podcaster_path)
          
        end
    end
    
    
    
end
