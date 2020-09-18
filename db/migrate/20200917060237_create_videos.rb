class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.references :routine, foreign_key: true
      t.string :url
      t.integer :start_time
      t.integer :end_time
      t.integer :time

      t.timestamps
    end
  end
end
