json.array!(@notifications) do |notification|
  json.extract! notification, :id, :type, :destination, :user_id
  json.url notification_url(notification, format: :json)
end
