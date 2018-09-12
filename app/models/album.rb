class Album < ApplicationRecord
  attr_accessor :images
  belongs_to :user
  has_many :photos, dependent: :destroy
  validates :title, length: { maximum: 140 }, presence: true
  validates :description, length: { maximum: 300 }, presence: true
  scope :order_by_created_at, -> { order(created_at: :desc) }
  scope :shared, -> { where(share_mode: true) }
  validates :images, presence: true
  after_create :create_images
  after_update :update_images
  MAX_IMAGE_SHOW = 3

  private
  def create_images
    @images.each do |image|
      self.photos.create!(image: image)
    end
  end

  def update_images
    self.photos.delete_all
    @images.each do |image|
      self.photos.create!(image: image)
    end
  end
end
