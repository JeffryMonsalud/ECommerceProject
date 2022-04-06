# require 'csv'

Product.create(
    name: 'Test'
)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

puts "Created #{Product.count} Product(s)."