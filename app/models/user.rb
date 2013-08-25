class User < ActiveRecord::Base
  attr_accessible :email, :password, :username
  has_secure_password
  validates_uniqueness_of :username
  validates_presence_of :email
end
