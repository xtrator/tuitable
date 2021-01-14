class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :name, :string
    add_column :users, :role, :integer, default: 0

    add_index :users, :username, unique: true
  end
end
