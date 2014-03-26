class CreatePlabs < ActiveRecord::Migration
  def change
    create_table :plabs do |t|

      t.timestamps
    end
  end
end
