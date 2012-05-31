class CreateMaintainers < ActiveRecord::Migration
  def change
    create_table :maintainers do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :login, :null => false
      t.string :time_zone, :default => 'UTC'
      t.string :jabber, :default => ''
      t.text :info, :default => ''
      t.string :website, :default => ''
      t.string :location, :default => ''

      t.timestamps
    end
  end
end
