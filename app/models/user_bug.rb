class UserBug < ApplicationRecord
	belongs_to :appuser
	belongs_to :bug
end