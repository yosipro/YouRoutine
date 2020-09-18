class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.string :password_digest
      t.integer :gender
      t.integer :ages
      t.binary :image

      t.timestamps
    end
  end
end
