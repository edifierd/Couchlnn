class CouchType < ActiveRecord::Base
	validates :titulo,
	presence: true, 
	uniqueness: true

end
