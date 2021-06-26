json.extract! customer, :id, :name, :phone, :created_at, :updated_at, ::address_id
json.url customer_url(customer, format: :json)
