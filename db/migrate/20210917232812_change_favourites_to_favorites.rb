class ChangeFavouritesToFavorites < ActiveRecord::Migration[6.1]
  def change
    rename_table :favourites, :favorites
  end
end
