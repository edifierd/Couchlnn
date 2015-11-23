class Couch < ActiveRecord::Base
	belongs_to :user
	has_one :CouchType
end
