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
class ChannelsUsers < ApplicationRecord
  belongs_to :channel
  belongs_to :user

  validates :user_id, uniqueness: { scope: :channel_id }
end
