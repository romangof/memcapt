class User < ActiveRecord::Base
  has_many :images

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  before_save :set_auth_token
  before_create :hash_pass
  
  def set_auth_token
    # return if auth_token.present?
    self.auth_token = generate_auth_token
    self.token_expiry = (Time.now + 3600).to_s
    # self.token_expiry = (Time.now + 30).to_s
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end

  def hash_pass
    self.password = password.hash
  end

  def expire_token
    self.auth_token = "expired"  
    self.save  
  end

end
