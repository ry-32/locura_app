class HomeController < ApplicationController
  
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  
  
  AWS.config(access_key_id: 'AKIASPFJAJC7YUQXALHV',secret_access_key: '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',region: 'ap-northeast-1')
  
  
  def index
    @a = Advertiser.first
  end
  
  def login_form
  end
  
  def login
    
    @advertiser = Advertiser.find_by(email: params[:email])
    @podcaster = Podcaster.find_by(email: params[:email])
    @error_messages = []

    
    # 広告主
    if @advertiser
      if @advertiser.authenticate(params[:password])
        session[:user_id] = @advertiser.id
        flash[:notice] = "ログインしました"
        redirect_to('/myaccount')
      else
        @error_messages.push("パスワードが違います")
        render action: :login_form
      end
      
    # 番組ホスト
    elsif @podcaster
      if @podcaster.authenticate(params[:password])
        session[:user_id] = @podcaster.id
        flash[:notice] = "ログインしました"
        redirect_to('/myaccount')
      else
        @error_messages.push("パスワードが違います")
        render action: :login_form
      end
      
    elsif params[:email] == "" or params[:password] == ""
    
      if params[:email] == ""
        @error_messages.push('メールアドレスを入力してください')
      end
      if params[:password] == ""
        @error_messages.push('パスワードを入力してください')
      end
      
      render action: :login_form
      
    else
      render action: :login_form
    end
    
    
    
    if @advertiser
      if @advertiser.errors.any?
        @errors = @advertiser.errors
      end
    end
    if @podacster
      if @podcaster.errors.any?
        @errors = @podcaster.errors
      end
    end
    
    # binding.pry
    
  end
    
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end
  
  def myaccount
    
    if @current_user_ad
      
      @advertiser = Advertiser.find_by(id: @current_user_ad.id)
      @user = @advertiser
      @deals = Deal.where(advertiser_id: @user.id)
      @deals_pending = @deals.where(advertiser_id: @user.id, status:"pending")
      @deals_progress = @deals.where(advertiser_id: @user.id, status:"progress")
    
    
    elsif @current_user_pod
      
      # variables
      @podcaster = Podcaster.find_by(id: @current_user_pod.id)
      @user = @podcaster
      @deals = Deal.where(podcaster_id: @user.id)
      @deals_pending = @deals.where(podcaster_id: @user.id, status:"pending")
      @deals_progress = @deals.where(podcaster_id: @user.id, status:"in progress")
      
      
      
      
      
      if Program.find_by(host_id: @podcaster.id)
        @program = Program.find_by(host_id: @podcaster.id)
        
        if Episode.where(program_id: @program.id)
          @episodes = Episode.where(program_id: @program.id)
        end
      else
        @program_new = Program.new
      end
    
      
      @episode = Episode.new
      
    
    end
    
  end
  
  def manage_deal_pod
    
    @podcaster = @current_user_pod
    @deal = Deal.find_by(id: params[:deal_id])
    @manage = params[:manage_id]
    
    if @manage == "0"
      @deal.status = "in progress"
    elsif @manage == "1"
      @deal.status = "denied"
    end
    
    
    # ここで案件の広告枠数をEPの広告枠数をから引いて
    # 広告枠数の整合性が合うようにする
    @episode = Episode.find_by(id: @deal.episode_id)
    
    if @manage == "0"
      if @deal.pre_roll_30.present?
        @episode.pre_roll_30 -= @deal.pre_roll_30
      end
      if @deal.pre_roll_60.present?
        @episode.pre_roll_60 -= @deal.pre_roll_60
      end
      if @deal.mid_roll_30.present?
        @episode.mid_roll_30 -= @deal.mid_roll_30
      end
      if @deal.mid_roll_60.present?
        @episode.mid_roll_60 -= @deal.mid_roll_60
      end
      if @deal.post_roll_30.present?
        @episode.post_roll_30 -= @deal.post_roll_30
      end
      if @deal.post_roll_60.present?
        @episode.post_roll_60 -= @deal.post_roll_60
      end
    end
    
    
    if @deal.save && @episode.save
      flash[:notice] = "キャンペーン情報を変更しました"
    else
      flash[:notice] = "キャンペーン情報の変更に失敗しました"
    end
    
    redirect_to('/myaccount')
    
  end
  
  def add_episode
    
    @program = Program.find_by(host_id: @current_user_pod.id)
    
    @episode = Episode.new(episode_params)
    @episode.program_id = @program.id
    
    if @episode.save
      redirect_to('/myaccount')
    end
    
  end
  
  
  
  def edit_episode
    
    @episode = Episode.find_by(id: params[:id])
    @episode.update(episode_params)
    
    if @episode.save
      redirect_to('/myaccount')
    else
      redirect_to root_path
    end
    
    
  end
  
  
  
  def edit_program_info
    
    @podcaster = @current_user_pod
    @program = Program.find_by(host_id: @podcaster.id)
    @program.update(program_params)
    
    
    if program_params[:prof_file].present?
      
      s3 = AWS::S3.new(s3_endpoint: "s3-ap-northeast-1.amazonaws.com")
      bucket = s3.buckets['locura-bucket']
      
      file = program_params[:prof_file]
      file_name = @program.name+'_'+@program.id.to_s+'_'+file.original_filename
      file_full_path="profile/"+file_name
      
      object = bucket.objects[file_full_path]
      object.write(file,:acl => :public_read)
      @program.prof_file = "http://s3-ap-northeast-1.amazonaws.com/locura-bucket/profile/#{file_name}"
         
      if @program.save == false
        flash[:notice] = "編集の保存に失敗しました"
        render action: 'myaccount'
      end
    
    end
    
    
    
    flash[:notice] = "保存に成功しました"
    
    redirect_to('/myaccount')
    
    
  end

  def file_upload
    
    @podcaster = @current_user_pod
    @program = Program.find_by(host_id: @podcaster.id)
    
    # @s3image = DlFile.new(params[:file]) #data_file_params
    s3 = AWS::S3.new
    bucket = s3.buckets['locura-bucket']
    
    file = program_params[:dlfile]
    file_name = @podcaster.name+'_'+@podcaster.id.to_s+'_'+file.original_filename
    file_full_path="images/"+file_name
    
    object = bucket.objects[file_full_path]
    object.write(file)
    @program.dlfile="http://s3-ap-northeast-1.amazonaws.com/locura-bucket/images/#{file_name}"
    
    
    if @program.save
      flash[:notice] = "ファイルの保存に成功しました"
    else
      flash[:notice] = "ファイルの保存に失敗しました"
    end
    
    redirect_to '/myaccount'
    
  end
    



  def edit_profile
    
    if @current_user_ad
      @advertiser = Advertiser.find_by(id: @current_user_ad.id)
      @advertiser.update(account_params)
      
      if account_params[:password].present?
        pass = account_params[:password]
        pass_conf = account_params[:password_confirmation]
        
        if pass_conf == pass
          @advertiser.update(account_params)
          if @advertiser.save
            flash[:notice] = "パスワードを変更しました"
          else
            flash[:notice] = "パスワードの変更に失敗しました。パスワードが空欄でないこと、8文字以上であることを確認してください"
          end
        else
          flash[:notice] = "パスワードの変更に失敗しました。パスワードと再確認用のパスワードが違います"
        end
      end
      
    elsif @current_user_pod
      @podcaster = Podcaster.find_by(id: @current_user_pod.id)
      @podcaster.update(account_params)
      
      if account_params[:password].present?
        pass = account_params[:password]
        pass_conf = account_params[:password_confirmation]
        
        if pass_conf == pass
          @podcaster.update(account_params)
          if @podcaster.save
            flash[:notice] = "パスワードを変更しました"
          else
            flash[:notice] = "パスワードの変更に失敗しました。パスワードが空欄でないこと、8文字以上であることを確認してください"
          end
        else
          flash[:notice] = "パスワードの変更に失敗しました。パスワードと再確認用のパスワードが違います"
        end
      end
    end

    redirect_to('/myaccount')
    
  end
  
  def delete_account
    
    if @current_user_ad
      @advertiser = Advertiser.find_by(id: @current_user_ad.id)
      @advertiser.destroy
    elsif @current_user_pod
      
      @podcaster = Podcaster.find_by(id: @current_user_pod.id)
      @podcaster.destroy
      
      @program = Program.find_by(host_id: @podcaster.id)
      @program.destroy
      
      @episodes = Episode.where(program_id: @program.id)
      @episodes.destroy_all
    
    end
    
    redirect_to('/')
    
  end
  
  
  
  def delete_program
    
    @program = Program.find_by(id: params[:id])
    @episodes = Episode.where(program_id: @program.id)
    
    @program.destroy
    @episodes.destroy_all
    
    redirect_to('/myaccount')

  end
    
  
  def delete_episode
    
    @episode = Episode.find_by(id: params[:id])
    @episode.destroy
    
    redirect_to ('/myaccount')
    
  end


  def contact
    @contact = Contact.new
  end
  
  def contact_send
    
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "お問い合わせありがとうございます"
      redirect_to('/')
    else
      render action: :contact
    end
    
  end
  
  
  
  
  private
  
  def data_file_params
    params.require(:dl_file).permit(:file)
  end
  
  def account_params
    if @current_user_ad
      params.require(:advertiser).permit(:name,:company_name, :email,:password, :password_confirmation)
    elsif @current_user_pod
      params.require(:podcaster).permit(:name,:podcast_name,:email,:password, :password_confirmation)
    end
  end
  
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
  
  def program_params
    params.require(:program).permit(:name, :description, :genre, :dl, :hosting,
    :start_date, :host_id, :program_url, :hp_url, :cpm_30_pre, :cpm_60_pre,
    :cpm_30_mid, :cpm_60_mid, :cpm_30_post, :cpm_60_post,:prof_file,:dlfile)
  end
  
  def episode_params
    
    params.require(:episode).permit(:date,:program_id,:name,:pre_roll_30,:pre_roll_60,
    :mid_roll_30,:mid_roll_60,:post_roll_30,:post_roll_60)
    
  end
  
  
end
