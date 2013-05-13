class Vote < ActiveRecord::Base
  attr_accessible :lawsuit_id, :positive, :user_id
  belongs_to :user
  belongs_to :lawsuit

  validates :lawsuit_id, presence: true
  validates :user_id, presence: true
  validates :positive, presence: true

  def vote_count_type(id, type)
    select = Votes.where('lawsuit_id', id)
    select = select.where('positive', type)
    select.count
  end

  default_scope order: 'lawsuits.created_at DESC'  
end
