class Seed < ActiveRecord::Base
	belongs_to :user

	has_many :posts
	accepts_nested_attributes_for :posts, allow_destroy: true
	
end
