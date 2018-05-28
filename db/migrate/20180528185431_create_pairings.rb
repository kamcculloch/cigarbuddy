class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.integer :cigar_id
      t.integer :bottle_id

      t.timestamps

    end
  end
end
