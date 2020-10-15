class OverviewsController < ApplicationController
  def index
    @routines = Routine.where(status: 0).order(id: :desc).page(params[:page]).per(9)
  end
  
  def search
    
    @selected = params[:search].to_i
   
    if params[:search].to_i == 0

        if Routine.where(time: 0..5).where(status: 0).present?
          @routines = Routine.where(time: 0..5).where(status: 0).order(time: :desc).page(params[:page]).per(9)
        else
          flash[:danger] = '条件に合うルーティンが見つかりませんでした'
          redirect_to routine_none_path
        end
    
        
      
    elsif params[:search].to_i == 1
      
        if Routine.where(time: 0..10).where(status: 0).present?
          @routines = Routine.where(time: 0..10).where(status: 0).order(time: :desc).page(params[:page]).per(9)
        else
          flash[:danger] = "条件に合うルーティンが見つかりませんでした"
          redirect_to routine_none_path
        end
      
    elsif params[:search].to_i == 2

        if Routine.where(time: 0..15).where(status: 0).present?
          @routines = Routine.where(time: 0..15).where(status: 0).order(time: :desc).page(params[:page]).per(9)
        else
          flash[:danger] = "条件に合うルーティンが見つかりませんでした"
          redirect_to routine_none_path
        end
     
    else 
    
        if Routine.where("time > ?", 15).where(status: 0).present?
          @routines = Routine.where("time > ?", 15).where(status: 0).order(id: :desc).page(params[:page]).per(9)
        else
          flash[:danger] = "条件に合うルーティンが見つかりませんでした"
          redirect_to routine_none_path
        end
        
    end
  end
  
  def none
  end
end
