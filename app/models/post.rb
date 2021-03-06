class Post < ApplicationRecord
	
  belongs_to :user
  has_many   :comments, dependent: :destroy
  has_many   :likes, dependent: :destroy
  validates  :title, presence: true
  
  mount_uploader :image, AvatarUploader

end
