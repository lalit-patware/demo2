class AddAddressToEmployments < ActiveRecord::Migration[5.2]
  def change
    add_column :employments, :address, :string
  end
end
