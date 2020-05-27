# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  avatar_content_type    :string
#  avatar_file_name       :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  dob                    :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  facebook               :string
#  firstname              :string
#  instagram              :string
#  is_admin               :boolean          default(FALSE), not null
#  lastname               :string
#  mobile                 :string
#  notice                 :text
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  skype                  :string
#  superadmin             :boolean
#  twitter                :string
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

  attr_writer :login

  has_and_belongs_to_many :channels
  has_many :messages, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validate :validate_username

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage/.*\z}
  
  def notification_channels
    ChannelsUsers.where(read: false, user_id: id, channel_id: channels)
  end

  def login
    @login || self.username || self.email
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end

  def self.create_new_user(params)
    @user = User.create!(params)
  end
end
