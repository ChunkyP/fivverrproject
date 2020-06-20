class CreateNotificationsUser < ActiveRecord::Migration[6.0]
  def change
    create_table :anotifications_users do |t|
      t.references :anotification, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
