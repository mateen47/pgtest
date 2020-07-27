class UserProject < ApplicationRecord
	belongs_to :appuser
  belongs_to :project
end