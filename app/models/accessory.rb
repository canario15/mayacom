class Accessory < ActiveRecord::Base

  belongs_to :brand
  belongs_to :access_type
  has_many :accessory_images

  has_and_belongs_to_many :phones, class_name: 'Phone', join_table: 'accessories_phones'

  accepts_nested_attributes_for :accessory_images, :allow_destroy => true
  accepts_nested_attributes_for :phones#, :allow_destroy => true

  paginates_per 9

  def compatible_phones
    data = {}
    brands = phones.select(:brand_id).distinct
    brands.each do |b|
      brand_name = Brand.find_by_id(b.brand_id).name
      phones_model = phones.where(:brand_id => b.brand_id).select(:model)
      phones_model.each do |p_m|
        data[brand_name] = "#{p_m.model}, #{data[brand_name]}"
      end
    end
    data
  end
end
