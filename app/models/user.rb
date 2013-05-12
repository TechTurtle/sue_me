class User < ActiveRecord::Base
  has_many :lawsuits 
  attr_accessible :city, :email, :first_name, :last_name, :state, :password, 
                  :password_confirmation
  has_secure_password
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                                    uniqueness: { case_sensitive: false }
  validates :city, presence: true
  validates :state, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  private
  
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
