class VideosController < ApplicationController
    
    
    def adding
      
      @routine = Routine.find_by(id: params[:routine_id])
      @video = @routine.videos.build(video_params)
      @videos = @routine.videos
          
      if @video.save
        flash[:success] = "ビデオを追加しました！"
        redirect_to routine_videos_new_path(@routine)
      else
        flash.now[:danger] = "ビデオの追加に失敗しました"
        render :new
      end
      
    end
    
    
    def new
      @routine = Routine.find_by(id: params[:routine_id])
     
      if params[:video_id]
        @video = Video.find_by(id: params[:video_id]) || @routine.videos.build
      else
        @video = @routine.videos.build
      end

    end
    
    def create
      @routine = Routine.find_by(id: params[:routine_id])
      @video = @routine.videos.build(video_params)
      @videos = @routine.videos
          
      if @video.save
        flash[:success] = "ビデオを追加しました！"
        redirect_to routine_videos_new_path(@routine)
      else
        flash.now[:danger] = "ビデオの追加に失敗しました"
        render :new
      end
    end
    
    def edit
      @video = current_user.routine_videos.find_by(id: params[:id])
      @routine = Routine.find_by(id: params[:routine_id])
    end
    
    def update
      @routine = Routine.find_by(id: params[:routine_id])
      @video = current_user.routine_videos.find_by(id: params[:id])
      
      if @video.update(video_params)
        flash[:success] = '動画は正常に更新されました！'
        redirect_to @routine
      else
        flash.now[:danger] = '動画が更新されませんでした'
        render :edit
      end
    end
    
    def destroy
      @routine = Routine.find_by(id: params[:routine_id])
      @video = current_user.routine_videos.find_by(id: params[:id])
      
      @video.destroy

      flash[:success] = '動画は正常に削除されました'
      redirect_to @routine
    end
    
    private
    
  def video_params
    params.require(:video).permit(:url, :start_time, :end_time, :description, :category)
  end
    
end
