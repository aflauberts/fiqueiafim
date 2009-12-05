class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.references :user
      t.string :first_name, :limit => 30, :null => false
      t.string :last_name,:limit => 30, :null => false
      t.string :sex, :null => false, :limit => 1
      t.string :orientation, :null => false
      t.string :visible_fields, :limit => 300
      t.timestamps
    end
  end
  
  def self.down
    drop_table :profiles
  end
end
