class ChangeDataImageToRoutine < ActiveRecord::Migration[5.2]
  def change
      change_column :routines, :image, :string
  end
end
