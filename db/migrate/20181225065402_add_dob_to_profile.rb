class AddDobToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :dob, :integer
  end
end
