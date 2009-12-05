class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.references :state
      t.string :name
     
      t.timestamps
    end
  end
  
  def self.down
    drop_table :cities
  end
end
