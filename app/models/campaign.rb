# == Schema Information
#
# Table name: campaigns
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Campaign < ActiveRecord::Base
  belongs_to :user
end
