class Question < ApplicationRecord
  include Editable

  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  belongs_to :user
  has_many :answers
  validates :content, presence: true


  def content_url
    # binding.pry
    <<-url
      <a href="/questions/#{self.id}" class="question-link"> #{self.content} </a>
    url
  end
end
