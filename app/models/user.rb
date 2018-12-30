class User < ApplicationRecord
  # Include default devise modules.
  # :omniauthable, :confirmable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  rolify

  has_many :books
end
