class User < ApplicationRecord
    has_secure_password
    validates :name, :email, presence: true, uniqueness: true
    validates :password, :address, presence: true

    def self.authenticate(email, password)
        user = User.find_by "email = ?", email
        if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
          user
        else
          nil
        end
    end
end