json.extract! admin_notification, :id, :body, :created_at, :updated_at
json.url admin_notification_url(admin_notification, format: :json)
