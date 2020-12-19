class AddDefaultForIsOpenCampaign < ActiveRecord::Migration[6.0]
  def up
    change_column :job_campaigns, :is_open, :integer, default: 0
  end

  def down
    change_column :job_campaigns, :is_open, :integer
  end
end
