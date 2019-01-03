class Profile < ApplicationRecord
	belongs_to :user
	has_many   :educations, dependent: :destroy
	has_many   :employments, dependent: :destroy
	has_many   :skills, dependent: :destroy

	accepts_nested_attributes_for :educations, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :employments, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true
	mount_uploader :image, AvatarUploader 
end
