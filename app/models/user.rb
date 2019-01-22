class User < ApplicationRecord  
  
  after_create :assign_profile 
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes
  has_one  :profile, dependent: :destroy
	 
  validates :name, presence: true    
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true, presence: true,
	                 length: {minimum: 5 }

  def create_reset_digest
  	self.reset_digest = SecureRandom.urlsafe_base64
	  save!
  end

  def send_password_reset_email
    self.reset_set_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver_now
  end

  def assign_profile
    create_profile 
  end

end