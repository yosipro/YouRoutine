class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "会員登録が完了しました！"
      redirect_to root_url
    else
      flash.now[:danger] = "会員登録に失敗しました"
      render :new
    end
  end

  def edit
  end
  
  def update
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :gender, :mail, :password, :password_confirmation, :image)
  end
end
