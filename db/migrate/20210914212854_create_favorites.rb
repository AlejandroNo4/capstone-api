class CreateFavurites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :trip_id

      t.timestamps
    end
  end
end
