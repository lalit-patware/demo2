class AddResetToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reset_set_at, :datetime
  end
end
