class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string, unique: true
    add_column :users, :is_admin, :boolean, default: false, null: false
    add_column :users, :skype, :string, unique: true
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :notice, :text
  end
end
