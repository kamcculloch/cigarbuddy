class CreateBoldnesses < ActiveRecord::Migration
  def change
    create_table :boldnesses do |t|
      t.string :name
      t.integer :taste_id

      t.timestamps

    end
  end
end
