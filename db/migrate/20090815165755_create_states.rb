class CreateStates < ActiveRecord::Migration
  def self.up
    create_table "states" do |t|
      t.string :name, :limit => 100
      t.string :uf, :limit => 2

    end
  end

  def self.down
    drop_table :states
  end
end
