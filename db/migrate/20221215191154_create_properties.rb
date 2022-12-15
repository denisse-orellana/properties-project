class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.decimal :price
      t.string :direction
      t.bigint :area
      t.bigint :room_number
      t.bigint :bathroom_number

      t.timestamps
    end
  end
end
