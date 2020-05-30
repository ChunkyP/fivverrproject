# == Schema Information
#
# Table name: nachrichtens
#
#  id              :integer          not null, primary key
#  body            :text
#  read            :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  conversation_id :integer
#  user_id         :integer
#
# Indexes
#
#  index_nachrichtens_on_conversation_id  (conversation_id)
#  index_nachrichtens_on_user_id          (user_id)
#
# Foreign Keys
#
#  conversation_id  (conversation_id => conversations.id)
#  user_id          (user_id => users.id)
#
require 'test_helper'

class NachrichtenTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
