class Message < ActiveRecord::Base

	
	belongs_to :user
	validates :message, presence: true
	validates_presence_of :name
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

end
