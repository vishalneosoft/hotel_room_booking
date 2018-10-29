class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :price
      t.string :room_no
      t.integer :room_type

      t.timestamps null: false
    end
  end
end
