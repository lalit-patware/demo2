class AddDobToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :dob, :date
  end
end
