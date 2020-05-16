# == Schema Information
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
require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
