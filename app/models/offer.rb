class Offer < ActiveRecord::Base
  paginates_per 9

  belongs_to :phone
  belongs_to :accessory
  has_many   :offer_images, :dependent => :destroy

  has_attached_file :slider_image, styles: { home: "1163x365" , thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  accepts_nested_attributes_for :offer_images, :allow_destroy => true

  validates_presence_of :title, :description, :price
  validates_attachment_content_type :slider_image, content_type: /\Aimage\/.*\Z/
  validate :validate_images

  scope :active, -> { where(active: :true) }

  def validate_images
    errors.add(:offer_images, "ingrese al menos una imagen") if offer_images.size < 1
  end

end
