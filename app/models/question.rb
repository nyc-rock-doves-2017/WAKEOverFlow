class Question < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  belongs_to :user
  has_many :answers
  validates :content, presence: true
end
