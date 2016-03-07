class Phone < ActiveRecord::Base

  belongs_to :brand
  has_many   :phone_images
  has_many   :phone_plan

  validates_presence_of :title

  has_and_belongs_to_many :accessories, class_name: 'Accessory', join_table: 'accessories_phones'

  accepts_nested_attributes_for :phone_images, :allow_destroy => true
  accepts_nested_attributes_for :accessories

  paginates_per 9

  def to_s
    "#{self.brand} #{self.model}"
  end

end





