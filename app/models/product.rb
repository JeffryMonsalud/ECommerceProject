class Product < ApplicationRecord
    belongs_to :category
    validates :name, :description, presence: true, uniqueness: true
    validates :price, :quantity, presence: true
    has_one_attached :image

    # def to_builder
    #     Jbuilder.new do |product|
    #         product.price stripe_price_id
    #         product.quantity 1
    #     end
    # end

    # after_create do
    #     product = Stripe::Product.create(name: name)
    #     price = Stripe::Price.create(product: product, unit_amount: self.price, currency: self.currency)
    #     update(stripe_product_id: product.id, stripe_price_id: price.id)
    # end

end