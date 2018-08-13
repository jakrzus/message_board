class Reply < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates_presence_of :user_id, :post_id, :comment
  validates :comment, length: {minimum: 10}

end
