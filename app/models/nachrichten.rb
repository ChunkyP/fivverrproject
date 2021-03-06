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
class Nachrichten < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :conversation_id, :user_id

  default_scope { order(created_at: :desc) }

  def self.to_csv
    attributes = %w[id sender message receiver created_at]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end

  def message
    body
  end

  def sender
    user.username
  end

  def receiver
    c_id = conversation_id
    conv = Conversation.find(c_id)
    conv.sender_id == user_id ? conv.receiver.username : conv.sender.username
  end


  private
  def nachrichten_time
    created_at.strftime('%d/%m/%y at %l:%M %p')
  end
end
