class Phone < ActiveRecord::Base

  paginates_per 9

  after_save :create_specification

  belongs_to :brand
  has_many   :phone_images, :dependent => :destroy
  has_many   :phone_plans
  has_one    :specification, :dependent => :delete
  has_many   :offer, :dependent => :destroy
  has_many   :slider, :dependent => :destroy
  has_and_belongs_to_many :accessories, class_name: 'Accessory', join_table: 'accessories_phones'

  accepts_nested_attributes_for :phone_images, :allow_destroy => true
  accepts_nested_attributes_for :accessories
  accepts_nested_attributes_for :specification, :allow_destroy => true

  validates_presence_of :phone_type, :mode, :title, :brand_id, :model, :new_price, :short_desc, :long_desc
  validate :validate_images


  def to_s
    "#{self.brand} #{self.model}"
  end

  def create_specification
    self.specification = Specification.create if self.specification.nil?
  end

  def validate_images
    errors.add(:phone_images, "ingrese al menos una imagen") if phone_images.size < 1
  end

end

