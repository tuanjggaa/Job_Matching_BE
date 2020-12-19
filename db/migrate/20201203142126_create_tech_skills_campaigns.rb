class CreateTechSkillsCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :tech_skills_campaigns do |t|
      t.belongs_to :tech_skill
      t.belongs_to :job_campaign
      t.integer :priority
      t.integer :level

      t.timestamps
    end
  end
end
