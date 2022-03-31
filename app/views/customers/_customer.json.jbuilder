json.extract! customer, :id, :name, :address, :email_address, :created_at, :updated_at
json.url customer_url(customer, format: :json)
