class AddContactNoToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :contact_no, :integer
  end
end
