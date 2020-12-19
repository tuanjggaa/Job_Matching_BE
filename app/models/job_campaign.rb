class JobCampaign < ApplicationRecord
  enum skill_level: [ :internship, :freshman, :professional, :expert ]
  enum is_open: [ :yes, :no ]

  belongs_to :company

  has_many :languages_campaigns, dependent: :destroy
  has_many :languages, through: :languages_campaigns

  has_many :certifications_campaigns, dependent: :destroy
  has_many :certifications, through: :certifications_campaigns

  has_many :tech_skills_campaigns, dependent: :destroy
  has_many :tech_skills, through: :tech_skills_campaigns
  accepts_nested_attributes_for :tech_skills_campaigns, allow_destroy: true

  has_many :job_campaigns_students
  has_many :students, through: :job_campaigns_students

  validates :title, presence: true
  validates :salary, presence: true
  validates :work_hour_per_week, presence: true
  validates :gpa, presence: true
end
