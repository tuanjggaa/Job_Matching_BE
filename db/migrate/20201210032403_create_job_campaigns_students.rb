class CreateJobCampaignsStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :job_campaigns_students do |t|
      t.belongs_to :job_campaign
      t.belongs_to :student
      t.decimal :point
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
