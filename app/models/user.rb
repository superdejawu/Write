class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :seeds
  has_many :posts

  validates :name, presence: true

  acts_as_voter

  
	def move_to(user)
	  tasks.update_all(user_id: user.id)
	end
end
