class CertificationsCampaign < ApplicationRecord
  belongs_to :certification
  belongs_to :job_campaign
end
