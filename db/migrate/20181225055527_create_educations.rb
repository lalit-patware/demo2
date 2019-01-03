class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.string :SSC
      t.string :HSC
      t.string :graduation
      t.string :post_graduation
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
