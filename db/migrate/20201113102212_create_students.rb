class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.text :information
      t.text :soft_skill_description
      t.decimal :gpa
      t.string :location
      t.integer :expected_salary
      t.integer :working_experience
      t.integer :school_year
      t.integer :is_open, default: 0
      t.integer :day_per_week
      t.references :user

      t.timestamps
    end
  end
end
