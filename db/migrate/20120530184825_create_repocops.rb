# encoding: utf-8

class CreateRepocops < ActiveRecord::Migration
  def change
    create_table :repocops do |t|
      t.integer :repository_id, :null => false
      t.string :name, :null => false
      t.string :version, :null => false
      t.string :release, :null => false
      t.string :arch, :null => false
      t.string :srcname, :null => false
      t.string :srcversion, :null => false
      t.string :srcrel, :null => false
      t.string :testname, :null => false
      t.string :status#, :null => false WTF?
      t.text :message#, :null => false WTF?

      t.timestamps
    end

    add_index :repocops, :srcname
    add_index :repocops, :srcversion
    add_index :repocops, :srcrel
  end
end
