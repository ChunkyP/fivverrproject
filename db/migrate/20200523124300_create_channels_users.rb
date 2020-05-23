class CreateChannelsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :channels_users do |t|
      t.timestamps
    end
  end
end
