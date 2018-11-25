class Question < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :answers
  has_one :feed_content, as: :content, dependent: :destroy
  
  after_create :create_feed_content
  
  validates_presence_of :user_id, :group_id, :text
  
  def user_answer(user_id)
    Answer.find_by(user_id: user_id, question_id: id)
  end
  
  def answered?(user)
    answers.exists?(user_id: user.id)
  end
  
  private
  def create_feed_content
    self.feed_content =FeedContent.create(group_id: group_id, updated_at: updated_at)
  end
end
