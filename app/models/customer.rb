class Customer < ApplicationRecord
    validates :name, :address, :email_address, presence: true, uniqueness: true
end
