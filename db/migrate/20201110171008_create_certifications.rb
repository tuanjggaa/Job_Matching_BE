class CreateCertifications < ActiveRecord::Migration[6.0]
  def change
    create_table :certifications do |t|
      t.string :name
      t.text :description
      t.string :vendor
      t.references :user

      t.timestamps
    end
  end
end
