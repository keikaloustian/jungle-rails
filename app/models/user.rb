class User < ApplicationRecord

  # implement BCrypt functionality
  has_secure_password

  # ensure email is not already in use (case insensitive by default)
  validates :email, uniqueness: { case_sensitive: false }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 8 }

  # method returns an instance of the user if authentication is successful, otherwise nil
  def self.authenticate_with_credentials(email, password)
    # Trim and convert email to lower case
    formatted_email = email.strip.downcase

    user = User.find_by(email: formatted_email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
  

end
