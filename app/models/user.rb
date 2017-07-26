class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable

  acts_as_orderer

  validates_presence_of :email
  validates_presence_of :password

end
