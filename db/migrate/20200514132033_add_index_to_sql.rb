class AddIndexToSql < ActiveRecord::Migration[6.0]
  def change
    add_index :messages, :channel_id, name: 'index_messages_on_channel_id'
    add_index :messages, :user_id, name: 'index_messages_on_user_id'
  end

  def down
    drop_table :channelsusers
  end
end
