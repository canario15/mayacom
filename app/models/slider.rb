class Slider < ActiveRecord::Base

  belongs_to :phone

  has_attached_file :image, styles: { home: "1163x365" , thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates_presence_of :title, :description, :image


end
