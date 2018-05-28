class CreateBottles < ActiveRecord::Migration
  def change
    create_table :bottles do |t|
      t.integer :alcohol_id

      t.timestamps

    end
  end
end
