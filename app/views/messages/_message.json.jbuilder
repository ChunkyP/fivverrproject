json.extract! message, :id, :message, :body, :user_id, :channel_id, :msg_type, :url, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at, :created_at, :updated_at
json.url message_url(message, format: :json)
