# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  avatar_content_type    :string
#  avatar_file_name       :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  firstname              :string
#  is_admin               :boolean          default(FALSE), not null
#  lastname               :string
#  notice                 :text
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  skype                  :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :channels
  has_many :messages, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage/.*\z}
  
  def notification_channels
    ChannelsUsers.where(read: false, user_id: id, channel_id: channels)
  end

  def self.create_new_user(params)
    @user = User.create!(params)
  end
end
