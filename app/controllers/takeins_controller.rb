class TakeinsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    video = Video.find(params[:video_id])
    current_user.possess(video)
    flash[:success] = "お気に入りのビデオに追加しました！"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    video = Video.find(params[:video_id])
    current_user.letgo(video)
    flash[:success] = "お気に入りから解除しました"
    redirect_back(fallback_location: root_path)
  end
end
