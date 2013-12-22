class Post < ActiveRecord::Base
	belongs_to :user

	
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	# validates :description, presence: true

	validates :writing, presence: true

	# validates :image, presence: true

end
