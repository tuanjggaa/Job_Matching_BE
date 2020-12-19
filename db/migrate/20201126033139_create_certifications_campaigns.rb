class CreateCertificationsCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :certifications_campaigns do |t|
      t.belongs_to :certification
      t.belongs_to :job_campaign

      t.timestamps
    end
  end
end
