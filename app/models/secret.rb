class Secret < ActiveRecord::Base
  attr_accessible :author_id, :recipient_id, :body

  belongs_to :author, :class_name => "User"
  belongs_to :recipient, :class_name => "User"

  validates :author_id, :recipient_id, :body, :presence => true
end
