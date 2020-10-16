class ProfilesController < ApplicationController
   before_action :require_user_logged_in

   
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_url
      flash[:danger] = '他のユーザーのプロフィールは編集できません'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = 'プロフィールは正常に更新されました'
      redirect_to root_url
    else
      flash[:danger] = 'プロフィールは更新されませんでした'
      redirect_to root_url
    end
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def user_params
      params.require(:user).permit(:name, :mail, :password_digest, :gender, :ages, :image)
  end
  

end
