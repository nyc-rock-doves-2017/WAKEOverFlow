class User < ApplicationRecord
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(password_string)
    @password = BCrypt::Password.create(password_string)
    self.password_hash = @password
  end

end
