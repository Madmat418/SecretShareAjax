class Friendship < ActiveRecord::Base
  attr_accessible :in_friend_id, :out_friend_id
  validates :in_friend_id, :out_friend_id, :presence => true
  validates :in_friend_id, :uniqueness => {:scope => :out_friend_id}

  belongs_to(
    :out_friend,
    :primary_key => :id,
    :foreign_key => :out_friend_id,
    :class_name => "User"
  )
  belongs_to(
    :in_friend,
    :primary_key => :id,
    :foreign_key => :in_friend_id,
    :class_name => "User"
  )
end
