class User < ApplicationRecord
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  def password=(string)
    self.password_hash = string
    # Replace with BCrypt Methods
  end
end
