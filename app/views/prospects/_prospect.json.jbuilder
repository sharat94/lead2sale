json.extract! prospect, :id, :full_name, :email, :phone, :location, :stage_id, :managed_by, :created_at, :updated_at
json.url prospect_url(prospect, format: :json)
