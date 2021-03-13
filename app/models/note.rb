class Note < ApplicationRecord
 has_many :shares
 has_many :roles, through: :shares
end
