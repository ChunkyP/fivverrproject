class AddFieldsToChannelsUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :channels_users, :user_id, :bigint, null: false
    add_column :channels_users, :channel_id, :bigint, null: false
    add_column :channels_users, :read, :boolean
  end
end
