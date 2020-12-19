class RemoveStudentColumnsFromUsers < ActiveRecord::Migration[6.0]
  def change
  	remove_column :users, :name, :string
  	remove_column :users, :information, :text
  	remove_column :users, :soft_skill_description, :text
  	remove_column :users, :gpa, :decimal
  	remove_column :users, :location, :string
  	remove_column :users, :expected_salary, :integer
  	remove_column :users, :working_experience, :integer
  	remove_column :users, :school_year, :integer
  	remove_column :users, :is_open, :integer
  	remove_column :users, :day_per_week, :integer
  	remove_column :users, :account_type, :integer, default: 1
  end
end
