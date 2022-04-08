class Category < ApplicationRecord
    has_many :products
    has_one_attached :image

    validates :category_name, :category_type, presence: true
end