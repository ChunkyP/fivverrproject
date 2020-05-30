class CreateNachrichtens < ActiveRecord::Migration[6.0]
  def change
    create_table :nachrichtens do |t|
      t.text :body
      t.references :conversation, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
