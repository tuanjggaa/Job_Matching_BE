class LanguagesCampaign < ApplicationRecord
  belongs_to :language
  belongs_to :job_campaign
end
