class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
   	  t.string :name
   	  t.string :expertise
   	  t.text :description
   	  t.string :address
   	  t.string :phone
   	  t.integer :working_hour
   	  t.string :country
   	  t.text :benefit
   	  t.integer :company_size
   	  t.string :tax_identification_number
   	  t.references :user

      t.timestamps
    end
  end
end
