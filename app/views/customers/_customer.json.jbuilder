json.extract! customer, :id, :full_name, :email, :phone, :location, :managed_by, :created_at, :updated_at
json.url customer_url(customer, format: :json)
