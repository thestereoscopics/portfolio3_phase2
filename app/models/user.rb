class User < ActiveRecord::Base
  include BCrypt
  validates :email , presence: true
  validates :password_hash, presence: true

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password == @password
      return user
    else 
      return nil
    end
  end

  def password
    @password ||= Password.new(self.password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  #TODO : Use bcrypt to store hashed passwords and authenticate users
end
