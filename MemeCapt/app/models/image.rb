class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :tags

  validates :privacity, presence: true
  validates :img_id, presence: true
  # validates :ext_url, presence: true
  validates :category, presence: true
  validates :user, presence: true

  before_create :set_ext_url

  def set_ext_url
    puts "asdasd im here #{ext_url} ****************** "
    self.ext_url = "testing"
  end
end
