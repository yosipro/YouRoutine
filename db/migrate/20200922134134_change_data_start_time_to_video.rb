class ChangeDataStartTimeToVideo < ActiveRecord::Migration[5.2]
  def change
      change_column :videos, :start_time, :text
  end
end
