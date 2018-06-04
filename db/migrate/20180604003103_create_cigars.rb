class CreateCigars < ActiveRecord::Migration
  def change
    create_table :cigars do |t|
      t.integer :boldness_id
      t.string :name
      t.integer :price
      t.string :country
      t.string :size
      t.string :image_url

      t.timestamps

    end
  end
end
