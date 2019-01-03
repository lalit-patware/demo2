class CreateEmployments < ActiveRecord::Migration[5.2]
  def change
    create_table :employments do |t|
      t.string :company_1
      t.string :company_2
      t.string :company_3
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
