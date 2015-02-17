class CreateSimons < ActiveRecord::Migration
  def change
    create_table :simons do |t|
      t.integer :value
      t.string :term

      t.timestamps
    end
  end
end
