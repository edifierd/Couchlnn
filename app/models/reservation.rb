class Reservation < ActiveRecord::Base
	belongs_to :user
	has_one :couch

	scope :confirmed, -> { where(confirmed: true) }
end
