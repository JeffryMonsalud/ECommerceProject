class Category < ApplicationRecord
    has_many :products

    validates :category_name, presence: true
    validates :category_type, presence: true, uniqueness: true
end
