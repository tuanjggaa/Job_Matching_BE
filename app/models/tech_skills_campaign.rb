class TechSkillsCampaign < ApplicationRecord
  enum priority: [ :required, :must, :important ]
  enum level: [ :beginner, :intermediate, :professional ]

  belongs_to :tech_skill
  belongs_to :job_campaign

  validates :priority, presence: true
  validates :level, presence: true
end
