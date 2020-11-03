class SessionsController < ApplicationController
  def new
  end

  def create
    mail = params[:session][:mail].downcase
    password = params[:session][:password]
    if login(mail, password)
      redirect_to root_url
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  private
  
   def login(mail, password)
    @user = User.find_by(mail: mail)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
   end
  
end
