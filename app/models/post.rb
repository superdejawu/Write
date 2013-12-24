class Post < ActiveRecord::Base
	belongs_to :user

	
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	# validates :description, presence: true

	validates :writing, presence: true

	# validates :image, presence: true

	acts_as_taggable
	acts_as_taggable_on :tags

end
