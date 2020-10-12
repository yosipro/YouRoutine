class PoolsController < ApplicationController
    
    def index
        @videos = current_user.possesses.order(id: :desc).page(params[:page]).per(9)
        
        if params[:routine_id]
            @routine = Routine.find_by(id: params[:routine_id])
        end
        
    end
    
    def mine
        @videos = current_user.possesses.order(id: :desc).page(params[:page]).per(9)
    end
    
    def all
        @videos = Video.select(:description).distinct.page(params[:page]).per(9)
    end
    
    def search
      
    if params[:search]
        
      if params[:category].to_i == 1
  
          if Video.search(params[:search]).where(category: 1).present?
            @videos = Video.select(:description, :start_time, :end_time, :url).distinct.where(category: 1).search(params[:search]).order(id: :desc).page(params[:page]).per(9)
          else
            flash[:danger] = '条件に合うビデオが見つかりませんでした'
            redirect_to all_pool_path
          end
      
          
        
      elsif params[:category].to_i == 2
        
          if Video.search(params[:search]).where(category: 2).present?
            @videos = Video.select(:description, :start_time, :end_time, :url).distinct.where(category: 2).search(params[:search]).order(id: :desc).page(params[:page]).per(9)
          else
            flash[:danger] = "条件に合うビデオが見つかりませんでした"
            redirect_to all_pool_path
          end
        
      elsif params[:category].to_i == 3
  
          if Video.search(params[:search]).where(category: 3).present?
            @videos = Video.select(:description, :start_time, :end_time, :url).distinct.where(category: 3).search(params[:search]).order(id: :desc).page(params[:page]).per(9)
          else
            flash[:danger] = "条件に合うビデオが見つかりませんでした"
            redirect_to all_pool_path
          end
          
      elsif params[:category].to_i == 4
  
          if Video.search(params[:search]).where(category: 4).present?
            @videos = Video.select(:description, :start_time, :end_time, :url).distinct.where(category: 4).search(params[:search]).order(id: :desc).page(params[:page]).per(9)
          else
            flash[:danger] = "条件に合うビデオが見つかりませんでした"
            redirect_to all_pool_path
          end
       
      else 
          @videos = Video.select(:description, :start_time, :end_time, :url).distinct.search(params[:search]).order(id: :desc).page(params[:page]).per(9)
      end
    
    else

      if params[:category].to_i == 1
  
          if Video.where(category: 1).present?
            @videos = Video.select(:description, :start_time, :end_time, :url).distinct.where(category: 1).order(id: :desc).page(params[:page]).per(9)
          else
            flash[:danger] = '条件に合うビデオが見つかりませんでした'
            redirect_to all_pool_path
          end
      
          
        
      elsif params[:category].to_i == 2
        
          if Video.where(category: 2).present?
            @videos = Video.select(:description, :start_time, :end_time, :url).distinct.where(category: 2).order(id: :desc).page(params[:page]).per(9)
          else
            flash[:danger] = "条件に合うビデオが見つかりませんでした"
            redirect_to all_pool_path
          end
        
      elsif params[:category].to_i == 3
  
          if Video.where(category: 3).present?
            @videos = Video.select(:description, :start_time, :end_time, :url).distinct.where(category: 3).order(id: :desc).page(params[:page]).per(9)
          else
            flash[:danger] = "条件に合うビデオが見つかりませんでした"
            redirect_to all_pool_path
          end
          
      elsif params[:category].to_i == 4
  
          if Video.where(category: 4).present?
            @videos = Video.select(:description, :start_time, :end_time, :url).distinct.where(category: 4).order(id: :desc).page(params[:page]).per(9)
          else
            flash[:danger] = "条件に合うビデオが見つかりませんでした"
            redirect_to all_pool_path
          end
       
      else 
          @videos = Video.select(:description, :start_time, :end_time, :url).distinct.order(id: :desc).page(params[:page]).per(9)
      end
      
    end
    
    end
    
end
