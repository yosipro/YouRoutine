class CreateTakeins < ActiveRecord::Migration[5.2]
  def change
    create_table :takeins do |t|
      t.references :user, foreign_key: true
      t.references :video, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :video_id], unique: true
    end
  end
end
