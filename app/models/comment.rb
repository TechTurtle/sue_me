class Comment < ActiveRecord::Base
  attr_accessible :lawsuit_id, :text, :user_id
  belongs_to :user
  belongs_to :lawsuit

  validates :text, presence: true, length: { maximum: 1024 }
  validates :lawsuit_id, presence: true
  validates :user_id, presence: true

  default_scope order: 'lawsuits.created_at DESC'  
end
