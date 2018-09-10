class Photo < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :album, optional: true
  has_attached_file :image, styles: { thumb: ["200x150#", :png] }
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }, presence: true, size: { in: 0..5.megabytes }, if: :check_album_id?
  validates :title, length: { maximum: 140 }, presence: true, if: :check_album_id?
  validates :description, length: { maximum: 300 }, presence: true, if: :check_album_id?
  scope :order_by_created_at, -> { order(created_at: :desc) }
  scope :photo_public, -> { where(share_mode: true) }

  def check_album_id?
    album_id.nil?
  end
end