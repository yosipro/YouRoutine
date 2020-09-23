class ChangeDataEndTimeToVideo < ActiveRecord::Migration[5.2]
  def change
      change_column :videos, :end_time, :text
  end
end
