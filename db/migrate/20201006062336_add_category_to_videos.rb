class AddCategoryToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :category, :integer
  end
end
