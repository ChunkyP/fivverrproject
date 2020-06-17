# == Schema Information
#
# Table name: anotifications
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Anotification < ApplicationRecord
  has_and_belongs_to_many :users
end
