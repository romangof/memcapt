class User < ActiveRecord::Base
  has_many :images

  validates :username, presence: true
  validates :password, presence: true, length: { in: 6..20 }
  validates :email, presence: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  before_create :set_auth_token
  before_create :hash_pass
  
  def set_auth_token
    puts "trying this"
    return if auth_token.present?
    self.auth_token = generate_auth_token
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end

  def hash_pass
    self.password = password.hash
    puts "asdasdas HERE MODEL"
  end

end
