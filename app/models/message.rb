class Message < ApplicationRecord
  belongs_to :user

  validates :body, presence: true
  validates_format_of :body, with: /\A.{1,160}\z/, on: :create

  def self.timeline(user = nil)
    if (user != nil)
      following_ids = user.followees(User).pluck(:id)
      all_ids= following_ids << user.id
      Message.where(user_id: all_ids).order("created_at DESC")
    else
      Message.order("created_at DESC")
    end
  end

end
