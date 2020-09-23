class VideosController < ApplicationController
    
    def new
    @routine = Routine.find_by(id: params[:routine_id])
    @video = @routine.videos.build
    end
    
    def create
      @routine = Routine.find_by(id: params[:routine_id])
      @video = @routine.videos.build(video_params)
      @videos = @routine.videos
          
      if @video.save
        flash[:success] = "ビデオを追加しました！"
        redirect_to new_routine_video_path(@routine)
      else
        flash.now[:danger] = "ビデオの追加に失敗しました"
        render :new
      end
    end
    
    def edit
    @routine = Routine.find_by(id: params[:routine_id])
    @video = @routine.videos.find(params[:id])
    end
    
    private
    
  def video_params
    params.require(:video).permit(:url, :start_time, :end_time)
  end
    
end
