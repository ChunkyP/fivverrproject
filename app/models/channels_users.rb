# == Schema Information
#
# Table name: channels_users
#
#  id         :integer          not null, primary key
#  read       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  channel_id :bigint           not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_channels_users_on_channel_id  (channel_id)
#  index_channels_users_on_user_id     (user_id)
#
class ChannelsUsers < ApplicationRecord
  belongs_to :channel
  belongs_to :user

  validates :user_id, uniqueness: { scope: :channel_id }
end
