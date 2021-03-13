class Share < ApplicationRecord
	belongs_to :note
	belongs_to :role 	
end
