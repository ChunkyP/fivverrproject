# == Schema Information
#
# Table name: channels
#
#  id         :integer          not null, primary key
#  muted      :boolean
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Channel < ApplicationRecord
  validates :name, uniqueness: true
  has_many :messages, dependent: :destroy
  has_and_belongs_to_many :users
end
