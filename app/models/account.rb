# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  betreiber              :boolean          default(FALSE), not null
#  dob                    :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  facebook               :string
#  firstname              :string
#  instagram              :string
#  is_admin               :boolean          default(FALSE), not null
#  last_seen_at           :datetime
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
class Account < ApplicationRecord
  self.table_name = 'users'
  attr_accessor :password, :password_confirmation
  attr_accessor :skip_password_validation
  has_many :messages, dependent: :destroy, foreign_key: 'user_id'

  default_scope { order(username: :asc) }

  def password_required?
    return false if skip_password_validation
    super
  end
end
