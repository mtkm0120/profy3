class Group < ApplicationRecord
  has_many :users
  has_many :questions, ->{ order("createrd_at DESC") }
end
