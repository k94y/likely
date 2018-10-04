class NonMember < ApplicationRecord
	validates :name, presence: true, length: {in: 1..255}
	validates :email, presence: true, length: {in: 1..255}

 	# has_many :contacts #うまくいかないかも

end
