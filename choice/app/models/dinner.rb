class Dinner < ApplicationRecord
	before_create :set_create_slug
	def to_param
 		slug
	end
	private
	def set_create_slug
	 loop do
 		self.slug = SecureRandom.hex(10)
 		break unless Dinner.where(slug: slug).exists?
 	 end
	end
	has_many :genres
	has_many :areas
	belongs_to :user
	has_many :votes
	accepts_nested_attributes_for :genres
	accepts_nested_attributes_for :areas
end
