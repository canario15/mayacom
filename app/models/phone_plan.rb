class PhonePlan < ActiveRecord::Base

  belongs_to :phone
  belongs_to :plan

  validates_presence_of :phone, :price
end
