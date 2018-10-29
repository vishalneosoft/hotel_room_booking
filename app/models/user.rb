class User < ActiveRecord::Base
  # Include default devise modules.
  has_many :bookings
  devise :database_authenticatable, :registerable,
         :rememberable
  # include DeviseTokenAuth::Concerns::User
  # validates :terms_of_service, acceptance: true
  validates :email, uniqueness: true
end
