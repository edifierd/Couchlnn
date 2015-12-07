class UserCalification < ActiveRecord::Base
	belongs_to :user
	has_one :user

	validates_inclusion_of :puntaje, in: 1..5

end
