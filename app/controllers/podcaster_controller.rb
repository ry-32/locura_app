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
      @program = Program.new(name: account_params[:podcast_name], host_id: @podcaster.id,
                  dl: account_params[:dl] )
      @program.save
      # session[:user_id] = @podcaster.id
      flash[:notice] = "Podcastチームが確認後、ご登録の可否に関してメールアドレスにご連絡差し上げます。"
      redirect_to ('/')
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
  
  
  
  def add_program
    
    @program = Program.new(program_params)
    @program.host_id = @current_user_pod.id
    
    if @program.save
      flash[:notice] = "番組情報を登録いたしました"
      redirect_to('/myaccount')
    else
      flash[:notice] = "番組情報の登録に失敗しました"
      redirect_to('/myaccount')
    end
    
  end
  
  
  
  
  
  private
  def account_params
    params.require(:podcaster).permit(:name, :email,:password, :podcast_name,:prof_file,:dl)
  end
    
    
  def program_params
    params.require(:program).permit(:name, :description, :genre, :dl, :hosting,
    :start_date, :host_id, :program_url, :hp_url, :cpm_30_pre, :cpm_60_pre,
    :cpm_30_mid, :cpm_60_mid, :cpm_30_post, :cpm_60_post,:prof_file)
  end
  
end
