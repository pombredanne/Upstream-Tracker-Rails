class AddLocToRecords < ActiveRecord::Migration
  def self.up
    add_column :records, :loc, :string
  end
 
  def self.down
    remove_column :records, :loc
  end
end
