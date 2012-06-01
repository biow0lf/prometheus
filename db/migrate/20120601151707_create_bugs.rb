class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.integer :bug_id, :null => false
      t.string :bug_status
      t.string :resolution
      t.string :bug_severity
      t.string :product
      t.string :component
      t.string :assigned_to
      t.string :reporter
      t.string :short_desc

      t.timestamps
    end

    add_index :bugs, :assigned_to
    add_index :bugs, :product
    add_index :bugs, :bug_status
  end
end
