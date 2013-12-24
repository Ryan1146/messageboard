class Message < ActiveRecord::Base

	validates :message, presence: true
	validates_presence_of :name

end
