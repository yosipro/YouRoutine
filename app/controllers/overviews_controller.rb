class OverviewsController < ApplicationController
  def index
    @routines = Routine.where(status: 0).order(id: :desc).page(params[:page])
  end
  
  def search
   
    if params[:search].to_i == 0

        if Routine.where(time: 0..5).where(status: 0).present?
          @routines = Routine.where(time: 0..5).order(time: :desc).order(id: :desc)
        else
          flash[:danger] = '条件に合うルーティンが見つかりませんでした'
          redirect_to overviews_path
        end
    
        
      
    elsif params[:search].to_i == 1
      
        if Routine.where(time: 0..10).where(status: 0).present?
          @routines = Routine.where(time: 0..10).order(time: :desc).order(id: :desc)
        else
          flash[:danger] = "条件に合うルーティンが見つかりませんでした"
          redirect_to overviews_path
        end
      
    elsif params[:search].to_i == 2

        if Routine.where(time: 0..15).where(status: 0).present?
          @routines = Routine.where(time: 0..15).order(time: :desc).order(id: :desc)
        else
          flash[:danger] = "条件に合うルーティンが見つかりませんでした"
          redirect_to overviews_path
        end
     
    else 
    
      @routines = Routine.where(status: 0).order(time: :desc).order(id: :desc)
      
    end
  end
  
end
