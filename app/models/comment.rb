class Comment < ApplicationRecord
  include Editable

  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :voteable
  belongs_to :user

  validates :content, presence: true
end
