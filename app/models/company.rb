class Company < ApplicationRecord
  belongs_to :user

  has_one_attached :logo
  has_one_attached :headline

  has_many :job_campaigns
end
