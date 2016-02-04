class User < ActiveRecord::Base
  has_many :images

  validates :username, presence: true
  validates :password, presence: true, length: { in: 6..20 }
  validates :email, presence: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
