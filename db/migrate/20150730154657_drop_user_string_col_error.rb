class DropUserStringColError < ActiveRecord::Migration
  def change
    remove_column :users, :string if column_exists? :users, :string
  end
end
