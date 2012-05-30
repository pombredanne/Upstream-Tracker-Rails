class AddVersionToRecords < ActiveRecord::Migration
  def self.up
    add_column :records, :latest_ver, :string
  end
 
  def self.down
    remove_column :records, :latest_ver
  end
end
