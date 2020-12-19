class Student < ApplicationRecord
  enum is_open: [ :yes, :no ]

  belongs_to :user

  has_one_attached :avatar

  has_many :certifications_students
  has_many :certifications, through: :certifications_students

  has_many :languages_students
  has_many :languages, through: :languages_students

  has_many :tech_skills_students
  has_many :tech_skills, through: :tech_skills_students
  accepts_nested_attributes_for :tech_skills_students, allow_destroy: true

  has_many :job_campaigns_students
  has_many :job_campaigns, through: :job_campaigns_students
end
