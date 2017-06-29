class Answer < ApplicationRecord
  include Editable
  
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  belongs_to :user
  belongs_to :question
end
