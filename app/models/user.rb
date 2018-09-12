class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :photos, dependent: :destroy
  has_many :albums, dependent: :destroy
  scope :order_by_created_at, -> { order(created_at: :desc) }
  has_attached_file :avatar, styles: { thumb: ["100x100#", :png] }, default_url: "missing.png"
  do_not_validate_attachment_file_type :avatar

  def fullname
    "#{first_name} #{last_name}"
  end

  def active_for_authentication?
    self.is_active?
  end

  def inactive_message
    is_active? ? super : I18n.t('inactive')
  end
end
