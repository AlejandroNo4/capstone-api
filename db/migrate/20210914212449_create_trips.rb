class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :destination
      t.float :price
      t.string :description
      t.integer :days
      t.string :hotel
      t.string :trip_type

      t.timestamps
    end
  end
end
