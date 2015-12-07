class Reservation < ActiveRecord::Base
	belongs_to :user
	has_one :couch

	scope :confirmed, -> { where(estado: "reservado") }
end
