class PickupsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    routine = Routine.find(params[:routine_id])
    current_user.obtain(routine)
    flash[:success] = 'ルーティンを取得しました。'
    redirect_to root_url
  end

  def destroy
    routine = Routine.find(params[:routine_id])
    current_user.release(routine)
    flash[:success] = 'ルーティンから削除しました。'
    redirect_to root_url
  end
end
