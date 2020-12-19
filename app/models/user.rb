class User < ApplicationRecord
  enum account_type: [ :student, :company, :admin, :super_admin ] #[0, 1, 2, 3]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :student, dependent: :destroy
  has_one :company, dependent: :destroy

  # scope :all_except, -> (user) { admin.where.not(id: user) }
end