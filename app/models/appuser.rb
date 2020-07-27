class Appuser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :name, presence: true, length: {maximum: 30}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX }
  validates_uniqueness_of :email
  validates :password, presence: true, length: {minimum: 5}, allow_nil: true
  enum user_type: [:manager, :developer, :qa]
  validates :user_type, presence: true
  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects
  has_many :user_bugs, dependent: :destroy
  has_many :bugs, through: :user_bugs

end
