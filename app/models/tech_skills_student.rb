class TechSkillsStudent < ApplicationRecord
  enum level: [ :beginner, :intermediate, :professional ]

  belongs_to :tech_skill
  belongs_to :student
end
