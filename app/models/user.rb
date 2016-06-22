class User < ActiveRecord::Base
	  has_many :secrets
	  has_many :likes, dependent: :destroy
	  has_many :secrets_liked, through: :likes, source: :secret
	  has_secure_password
	  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	  validates :name, :email, presence:true
	  validates :email, :uniqueness => true, :format => { :with => email_regex },
	   :uniqueness => { :case_sensitive => false }
	   validates :password, presence: true, :on => :create
  
end
