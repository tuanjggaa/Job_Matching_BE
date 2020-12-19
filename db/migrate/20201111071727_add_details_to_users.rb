class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :name, :string
  	add_column :users, :information, :text
  	add_column :users, :soft_skill_description, :text
  	add_column :users, :gpa, :decimal
  	add_column :users, :location, :string
  	add_column :users, :expected_salary, :integer
  	add_column :users, :working_experience, :integer
  	add_column :users, :school_year, :integer
  	add_column :users, :is_open, :integer
  	add_column :users, :day_per_week, :integer
  	add_column :users, :account_type, :integer, default: 1
  end
end
