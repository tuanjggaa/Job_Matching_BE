class CreateTechSkillsStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :tech_skills_students do |t|
      t.belongs_to :tech_skill
      t.belongs_to :student
      t.integer :level

      t.timestamps
    end
  end
end
