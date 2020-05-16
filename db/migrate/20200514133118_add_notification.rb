class AddNotification < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.bigint :user_id
      t.bigint :channel_id
      t.timestamps
    end

    add_index :notifications, :channel_id, name: 'index_notifications_on_channel_id'
    add_index :notifications, :user_id, name: 'index_notification_on_user_id'
  end
end
