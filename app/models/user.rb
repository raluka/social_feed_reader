# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  bio        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_many :follows
  has_many :followed_users, through: :follows
  has_many :followings, class_name: 'Follow', foreign_key: :followed_user_id
  has_many :followers, through: :followings, source: :user
  has_many :comments, :votes, :subscriptions
  has_many :feeds, through: :subscriptions
  has_many :activities, conditions: ['activities.following_user_is IS NULL']
  has_many :followed_activities, class_name: 'Activity', foreign_key: :following_user_id
end
