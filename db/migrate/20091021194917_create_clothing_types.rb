class CreateClothingTypes < ActiveRecord::Migration
  def self.up
    create_table :clothing_types do |t|
      t.string :description
      t.timestamps
    end
  end
  
  def self.down
    drop_table :clothing_types
  end
end
