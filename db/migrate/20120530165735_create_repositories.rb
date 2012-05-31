# encoding: utf-8

class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name, :null => false
      t.string :short_url, :null => false
      t.string :vendor, :null => false
      t.string :distribution, :null => false
      t.string :download_path, :null => false
      t.integer :order_id, :null => false

      t.timestamps
    end
  end
end
