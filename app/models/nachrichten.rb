# == Schema Information
#
# Table name: nachrichtens
#
#  id              :bigint           not null, primary key
#  body            :text
#  read            :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  conversation_id :bigint
#  user_id         :bigint
#
# Indexes
#
#  index_nachrichtens_on_conversation_id  (conversation_id)
#  index_nachrichtens_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (conversation_id => conversations.id)
#  fk_rails_...  (user_id => users.id)
#
class Nachrichten < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :conversation_id, :user_id

  private
  def nachrichten_time
    created_at.strftime("%d/%m/%y at %l:%M %p")
  end
end
