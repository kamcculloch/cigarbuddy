class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.integer :alcohol_id
      t.integer :taste_id
      t.string :price
      t.string :origin
      t.string :image_url

      t.timestamps

    end
  end
end
