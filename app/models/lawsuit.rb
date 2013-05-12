class Lawsuit < ActiveRecord::Base
  attr_accessible :content, :title, :suit_type, :user_id
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  validates :suit_type, presence: true

  default_scope order: 'lawsuits.created_at DESC'  
end
