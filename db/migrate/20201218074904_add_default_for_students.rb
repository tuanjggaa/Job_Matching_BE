class AddDefaultForStudents < ActiveRecord::Migration[6.0]
  def up
    change_column :students, :gpa, :decimal, default: 0
    change_column :students, :expected_salary, :integer, default: 0
    change_column :students, :day_per_week, :integer, default: 0
    change_column :job_campaigns, :salary, :integer, default: 0
    change_column :job_campaigns, :work_hour_per_week, :integer, default: 0
    change_column :job_campaigns, :gpa, :decimal, default: 0
  end

  def down
    change_column :students, :gpa, :decimal
    change_column :students, :expected_salary, :integer
    change_column :students, :day_per_week, :integer
    change_column :job_campaigns, :salary, :integer
    change_column :job_campaigns, :work_hour_per_week, :integer
    change_column :job_campaigns, :gpa, :decimal
  end
end
