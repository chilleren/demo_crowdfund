# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  display_name    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password

  has_many :campaigns

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4 }, on: :create

end
