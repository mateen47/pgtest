class Bug < ApplicationRecord
	

  has_attached_file :screenshot, styles: { large: "600*600>", medium: "300*300>", thumb: "150*150#"}
  validates_attachment_content_type :screenshot, content_type: /\Aimage\/.*\Z/ 
	has_many :user_bugs
  has_many :appusers, through: :user_bugs
  enum bug_type: [:bug, :feature]
	enum status: [:zero, :started, :completed, :resolved]
	belongs_to :project
  validates_uniqueness_of :title

	
end