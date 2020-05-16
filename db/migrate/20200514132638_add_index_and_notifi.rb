class AddIndexAndNotifi < ActiveRecord::Migration[6.0]
  def change
    add_column :channels_users, :user_id, :bigint, null: false
    add_column :channels_users, :channel_id, :bigint, null: false
    add_column :channels_users, :read, :boolean

    add_index :channels_users, :channel_id, name: 'index_channels_users_on_channel_id'
    add_index :channels_users, :user_id, name: 'index_channels_users_on_user_id'
  end
end
