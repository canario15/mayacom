class OfferImage < ActiveRecord::Base

  belongs_to :offer

  has_attached_file :image, styles: { medium: "400x400>", index: "303x218" , thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
