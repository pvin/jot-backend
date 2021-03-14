class Role < ApplicationRecord
	has_many :shares
	has_many :notes, through: :shares
	has_many :permissions
end
