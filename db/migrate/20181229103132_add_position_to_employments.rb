class AddPositionToEmployments < ActiveRecord::Migration[5.2]
  def change
    add_column :employments, :position, :string
  end
end
