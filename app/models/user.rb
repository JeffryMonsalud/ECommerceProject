class User < ApplicationRecord
    has_secure_password
    has_one :province
    validates :name, :email, presence: true, uniqueness: true
    validates :password, :address, presence: true
    attr_accessor :password_hash, :password_salt

    def to_s
        email
    end

    after_create do
        customer = Stripe::Customer.create(email: email)
        update(stripe_customer_id: customer.id)
    end

end