class Certification < ApplicationRecord
  has_many :certifications_users
  has_many :users, through: :certifications_users

  has_many :certifications_campaigns
  has_many :job_campaigns, through: :certifications_campaigns
end
