class CreateRoutines < ActiveRecord::Migration[5.2]
  def change
    create_table :routines do |t|
      t.text :title
      t.integer :time
      t.integer :status
      t.binary :image

      t.timestamps
    end
  end
end
