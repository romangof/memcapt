class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :tags through: :tag_images

    validates :privacity, presence: true
    validates :top_text
    validates :bot_text
    validates :img_id, presence: true
    validates :ext_url
    validates :category, presence: true
    validates :user, presence: true
end
