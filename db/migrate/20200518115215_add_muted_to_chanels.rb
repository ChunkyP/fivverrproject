class AddMutedToChanels < ActiveRecord::Migration[6.0]
  def change
    add_column :channels, :muted, :boolean
  end
end
