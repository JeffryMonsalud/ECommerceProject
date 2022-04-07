class Customer < ApplicationRecord
    belongs_to :category

    validates :name, :address, :email_address, presence: true, uniqueness: true
end
