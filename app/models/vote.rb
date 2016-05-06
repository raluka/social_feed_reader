# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  entry_id   :integer
#  type       :string
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vote < ActiveRecord::Base
  belongs_to :user
end

class UpVote < Vote
  belongs_to :entry, counter_cache: true

  after_create {|record| VoteActivity.write(record)}
end

class DownVote < Vote
  belongs_to :entry, counter_cache: true

  after_create {|record| VoteActivity.write(record)}
end



