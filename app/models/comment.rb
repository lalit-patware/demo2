class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates  :username, presence:true
end
