class Photo < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :album, optional: true
  has_attached_file :image, styles: { thumb: ["100x100#", :png] }
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }, presence: true
  scope :order_by_created_at, -> { order(created_at: :desc) }
  scope :photo_pucblic, -> { where(share_mode: true) }
end