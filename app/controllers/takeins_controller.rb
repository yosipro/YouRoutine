class TakeinsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    video = Video.find(params[:video_id])
    current_user.possess(video)
    flash[:success] = "ビデオのプールに追加しました"
    redirect_to root_path
  end

  def destroy
    video = Video.find(params[:video_id])
    current_user.letgo(video)
    flash[:success] = "ビデオをプールから放出しました"
    redirect_to root_path
  end
end
