class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :pkgName
      t.string :branch
      t.string :method
      t.string :info
      t.string :verctrl
      t.string :verctrlInfo
      t.boolean :processed
      t.boolean :error
      t.text :errorMessage

      t.timestamps
    end
  end
end
