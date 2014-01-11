class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :seed

	# has_many :seedings
	# has_many :seeds, through: :seedings
	# accepts_nested_attributes_for :seeds
	# accepts_nested_attributes_for :seedings



	
	def self.seeded_with(prompt)
	  Seed.find_by_prompt!(prompt).posts
	end

	def self.seed_prompt(prompt)
	  Seed.find_by_prompt!(prompt).prompt
	end

	# #don't quite understand, learn eventually
	
	# # def self.tag_counts
	# #   Seed.select("seeds.*, count(seedings.seed_id) as count").
	# #     joins(:seedings).group("seedings.seed_id")
	# # end

	# def seed_list
	#   seeds.map(&:name).join(", ")
	# end

	# def seed_list=(names)
	#   self.seeds = names.split(",").map do |n|
	#     Seed.where(name: n.strip).first_or_create!
	#   end
	# end

	# has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	# # validates :description, presence: true

	# validates :writing, presence: true

	# # validates :image, presence: true



end
