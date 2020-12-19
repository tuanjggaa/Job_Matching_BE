class Language < ApplicationRecord
  has_many :languages_users
  has_many :users, through: :languages_users

  has_many :languages_campaigns
  has_many :job_campaigns, through: :languages_campaigns
end