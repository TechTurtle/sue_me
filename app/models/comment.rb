class Comment < ActiveRecord::Base
  attr_accessible :integer, :integer, :lawsuit_id, :text, :user_id
end
