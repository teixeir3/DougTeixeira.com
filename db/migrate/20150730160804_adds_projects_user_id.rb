class AddsProjectsUserId < ActiveRecord::Migration
  def up
    add_column :projects, :user_id, :integer, null: false
    add_index :projects, :user_id
  end
  
  def down
    remove_column :projects, :user_id
  end
end
