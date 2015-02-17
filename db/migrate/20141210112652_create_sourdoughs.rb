class CreateSourdoughs < ActiveRecord::Migration
  def change
    create_table :sourdoughs do |t|
      t.integer :player_key
      t.string :namo
      t.date :start_date
      t.date :end_date

    end
  end
end
