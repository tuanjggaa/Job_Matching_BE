class TechSkill < ApplicationRecord
  belongs_to :category_tech_skill, optional: true

  has_many :tech_skills_users
  has_many :users, through: :tech_skills_users

  has_many :tech_skills_campaigns
  has_many :tech_skills, through: :tech_skills_campaigns

  validates :name, presence: true
end
