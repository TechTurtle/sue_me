class User < ActiveRecord::Base
   
  attr_accessible :city, :email, :first_name, :last_name, :state, :password, 
                  :password_confirmation
  has_secure_password
  
  before_save { |user| user.email = email.downcase }

  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                                    uniqueness: { case_sensitive: false }
  validates :city, presence: true
  validates :state, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
end
