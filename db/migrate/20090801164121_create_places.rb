class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.references :city
      t.string :description, :limit => '100'
      t.references :category
      t.references :district
      t.text :tags
      t.timestamps
    end
  end
  
  def self.down
    drop_table :places
  end
end
