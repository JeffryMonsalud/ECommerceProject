# require 'csv'
CategoryProduct.delete_all
AdminUser.delete_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Product.count.each do |product|
    CategoryProduct.create(
        category_id: product.product_id,
        product_id: product.category_id
    )
end

puts "Created #{CategoryProduct.count} Product(s)."