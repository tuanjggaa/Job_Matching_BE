class DropTechSkillsUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :tech_skills_users do |t|
      t.belongs_to :tech_skill
      t.belongs_to :user

      t.timestamps
    end
  end
end
