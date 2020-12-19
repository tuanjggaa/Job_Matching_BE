class CreateJobCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :job_campaigns do |t|
      t.string :title
      t.integer :salary
      t.integer :work_hour_per_week
      t.decimal :gpa
      t.integer :is_open
      t.string :location
      t.integer :quantity
      t.text :description
      t.integer :min_intern_month
      t.integer :skill_level
      t.references :company

      t.timestamps
    end
  end
end
