class Tag < ActiveRecord::Base
  has_many :images through: :tag_images

  validates :tagname
end
