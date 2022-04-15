# require 'csv'
CategoryProduct.delete_all
AdminUser.delete_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

puts "Created #{Product.count} Product(s)."