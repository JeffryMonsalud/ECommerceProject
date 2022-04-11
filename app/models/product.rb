class Product < ApplicationRecord
    belongs_to :category
    validates :name, :description, presence: true, uniqueness: true
    validates :price, :quantity, presence: true
    has_one_attached :image

end
