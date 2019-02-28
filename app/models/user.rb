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
  # validate :password_complexity

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

  # # def password_complexity
  # #   return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,20}$/

  #   errors.add :password, 'Complexity requirement not met. Length should be 6-20 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  # end

end