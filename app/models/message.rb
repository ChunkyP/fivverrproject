#
# Table name: messages
#
#  id                  :integer          not null, primary key
#  avatar_content_type :string
#  avatar_file_name    :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  body                :text
#  message             :string
#  msg_type            :integer
#  url                 :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  channel_id          :bigint
#  user_id             :bigint
#
# Indexes
#
#  index_messages_on_channel_id  (channel_id)
#  index_messages_on_user_id     (user_id)
#
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  enum msg_type: { 'text' => 0, 'image' => 1 }

  has_one_attached :avatar
  # has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  # validates_attachment_content_type :avatar, content_type: %r{\Aimage/.*\z}

  def self.to_csv
    attributes = %w{id sender message Room created_at}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end

  def sender
    user.username
  end

  def Room
    channel.name
  end
end
