module RoutinesHelper
    
    def format_minutes(minutes)
        "#{minutes}分"
    end

    def format_seconds(seconds)
        "#{seconds}秒間"
    end
    
    def durations(video)
        s_time = video.start_time
        s_times = s_time.split(':').first
        minute = s_times.to_i * 60
        time = minute +  s_time.split(':').last.to_i
        start_time_minute = (time / 60 ).floor
        start_time_second = time - (start_time_minute * 60)
       
        e_time = video.end_time
        e_times = e_time.split(':').first
        e_minute = e_times.to_i * 60
        end_time = e_minute +  e_time.split(':').last.to_i
        end_time_minute = (end_time / 60 ).floor
        end_time_second = end_time - (end_time_minute * 60)
        
        "#{start_time_minute}分#{start_time_second}秒 ~ #{end_time_minute}分#{end_time_second}秒"
    end
end
