class JobCampaignsStudent < ApplicationRecord
  enum status: [ :matched, :rejected ]

  belongs_to :job_campaign
  belongs_to :student
end
