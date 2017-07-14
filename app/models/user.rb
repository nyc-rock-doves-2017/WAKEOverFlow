class User < ApplicationRecord
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true

  validate :password_validation

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(password_string)
    @password_string = password_string
    @password = BCrypt::Password.create(password_string)
    self.password_hash = @password
  end

  # Comment out when seeding
  def password_validation
    unless @password_string.length != 0
      errors.add(:password_validation, "password cannot be blank")
    end
  end

end

=begin
  Notes
  1) rubyonrails.org on 'Custom Methods':
  http://guides.rubyonrails.org/active_record_validations.html#custom-validators
=end
