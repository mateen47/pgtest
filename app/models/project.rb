class Project < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

	has_many :user_projects, dependent: :destroy
  has_many :appusers, through: :user_projects
  has_many :bugs, dependent: :destroy
end