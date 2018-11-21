class Question < ApplicationRecord
  belongs_to :user
  belongs_to :group
  
  validates_presence_of :user_id, :group_id, :text
end
