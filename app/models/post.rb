class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :tekst
  validates :tekst, length: {minimum: 10}
end
