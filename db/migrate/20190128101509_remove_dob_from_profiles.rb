class RemoveDobFromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :dob, :integer
  end
end
