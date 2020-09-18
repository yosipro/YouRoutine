class CreatePickups < ActiveRecord::Migration[5.2]
  def change
    create_table :pickups do |t|
      t.references :user, foreign_key: true
      t.references :routine, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :routine_id], unique: true
    end
  end
end
