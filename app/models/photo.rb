class Photo < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :album, optional: true
  has_attached_file :image, styles: { thumb: ["200x150#", :png] }
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }, presence: true, size: { in: 0..5.megabytes }, if: :no_album?
  validates :title, length: { maximum: 140 }, presence: true, if: :no_album?
  validates :description, length: { maximum: 300 }, presence: true, if: :no_album?
  scope :order_by_created_at, -> { order(created_at: :desc) }
  scope :shared, -> { where(share_mode: true) }

  def no_album?
    album_id.nil?
  end
end