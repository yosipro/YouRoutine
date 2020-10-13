module ApplicationHelper
    
    def not_find(something)
        if something == nil
        flash[:danger] = "条件に合うルーティンが見つかりませんでした"
        redirect_to root_path
        end
    end
   
    
end
