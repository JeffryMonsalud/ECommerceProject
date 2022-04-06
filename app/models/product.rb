class Product < ApplicationRecord
    belongs_to :category
    has_one_attached :image

    validates :name, :description, presence: true, uniqueness: true
    validates :price, :quantity, presence: true
end
