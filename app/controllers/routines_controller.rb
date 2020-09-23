class RoutinesController < ApplicationController
      require 'uri'
      
  def index
    @routines = current_user.routines
  end
  
  def show
    @routine = Routine.find(params[:id])
    @videos = @routine.videos
  end

  def new
    @routine = current_user.routines.build  
  end

  def create
    @routine = current_user.routines.build(routine_params)
    
    if @routine.save
      flash[:success] = "ルーティン登録が完了しました！"
      redirect_to new_routine_video_path(@routine)
    else
      flash.now[:danger] = "ルーティン登録に失敗しました"
      render :new
    end
  end

  def edit
    @routine = Routine.find(params[:id])
  end

  def update
    @routine = Routine.find(params[:id])
    
    if @routine.update(routine_params)
      flash[:success] = 'ルーティンは正常に更新されました'
      redirect_to @routine
    else
      flash.now[:danger] = 'ルーティンは更新されませんでした'
      render :edit
    end
  end

  def destroy
  end
  
  private

  def routine_params
    params.require(:routine).permit(:title, :time, :image, :status)
  end
end
