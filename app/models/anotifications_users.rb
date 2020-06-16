# == Schema Information
#
# Table name: anotifications_users
#
#  id               :integer          not null, primary key
#  anotification_id :integer          not null
#  user_id          :integer          not null
#
# Indexes
#
#  index_anotifications_users_on_anotification_id  (anotification_id)
#  index_anotifications_users_on_user_id           (user_id)
#
# Foreign Keys
#
#  anotification_id  (anotification_id => anotifications.id)
#  user_id           (user_id => users.id)
#
class AnotificationsUsers < ApplicationRecord
  belongs_to :anotification
  belongs_to :user
end
