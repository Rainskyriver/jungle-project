class User < ActiveRecord::Base

  has_secure_password
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: { minimum: 8}

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.strip.downcase)
    
    if user && user.authenticate(password)
      user
    end
  end

end
