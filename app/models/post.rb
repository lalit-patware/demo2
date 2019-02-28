class Post < ApplicationRecord
	
  belongs_to :user
  has_many   :comments, dependent: :destroy
  has_many   :likes, dependent: :destroy
  validates  :title, presence: true
  # delegate   :name, :to => :user, :prefix => true, :allow_nil => true
  
  mount_uploader :image, AvatarUploader
  paginates_per 5

end
