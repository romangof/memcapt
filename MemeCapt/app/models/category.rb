class Category < ActiveRecord::Base
  has_many :images

  validates :catname, presence: true
end
