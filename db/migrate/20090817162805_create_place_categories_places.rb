class CreatePlaceCategoriesPlaces < ActiveRecord::Migration
  def self.up
    create_table :categories_places do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :categories_places
  end
end
