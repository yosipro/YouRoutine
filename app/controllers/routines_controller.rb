class RoutinesController < ApplicationController
   before_action :require_user_logged_in
   before_action :correct_user, only: [:destroy]
      require 'uri'
      
  def index
    @routines = current_user.routines
    @obtainings = current_user.obtainings
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
      redirect_to routine_videos_new_path(@routine)
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
    @routine = Routine.find(params[:id])
      
    @routine.destroy

    flash[:success] = 'ルーティンは正常に削除されました'
    redirect_to root_url
  end
    
  
  private

  def routine_params
    params.require(:routine).permit(:title, :time, :image, :status)
  end
  
  def correct_user
    @routine = current_user.routines.find_by(id: params[:id])
    unless @routine
      redirect_to root_url
    end
  end
end
