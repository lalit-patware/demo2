class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :age
      t.string :image
      t.string :city
      t.string :education
      t.string :employment

      t.timestamps
    end
  end
end
