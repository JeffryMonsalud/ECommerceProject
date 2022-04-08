class Category < ApplicationRecord
    has_many :products
    has_one_attached :image

    validates :name, :category_type, presence: true
end