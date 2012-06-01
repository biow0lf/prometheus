# encoding: utf-8

class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, :null => false
      t.integer :repository_id, :null => false
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt

      t.timestamps
    end

    add_index :groups, :repository_id
    add_index :groups, :parent_id
  end
end
