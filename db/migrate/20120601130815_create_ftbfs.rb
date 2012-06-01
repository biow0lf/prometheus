# encoding: utf-8

class CreateFtbfs < ActiveRecord::Migration
  def change
    create_table :ftbfs do |t|
      t.string :name, :null => false
      t.string :epoch
      t.string :version, :null => false
      t.string :release, :null => false
      t.integer :weeks, :null => false
      t.string :arch, :null => false
      t.integer :repository_id, :null => false
      t.integer :maintainer_id, :null => false

      t.timestamps
    end

    add_index :ftbfs, :repository_id
    add_index :ftbfs, :maintainer_id
  end
end
