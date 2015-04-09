class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :type_room
      t.integer :price

      t.timestamps null: false
    end
  end
end
