class Message < ActiveRecord::Base

	
	belongs_to :user
	validates :message, presence: true
	validates_presence_of :name
	

end
