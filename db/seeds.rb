# require 'csv'
Product.delete_all
AdminUser.delete_all

Product.create(
    name: 'Test'
)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

puts "Created #{Product.count} Product(s)."