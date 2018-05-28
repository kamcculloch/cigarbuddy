class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.integer :boldness_id
      t.integer :taste_id

      t.timestamps

    end
  end
end
