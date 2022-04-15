class User < ApplicationRecord
    has_secure_password
    validates :name, :email, presence: true, uniqueness: true
    validates :password, :address, presence: true
    attr_accessor :password_hash, :password_salt

end