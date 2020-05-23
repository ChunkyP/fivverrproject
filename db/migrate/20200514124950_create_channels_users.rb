class CreateChannelsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :channels_users do |t|
      add_column :channels_users, :user_id, :bigint
      add_column :channels_users, :channel_id, :bigint
      add_column :channels_users, :read, :boolean
      t.timestamps
    end
  end
end
