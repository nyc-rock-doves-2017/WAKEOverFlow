class User < ApplicationRecord
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes










































  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
