class Offer < ActiveRecord::Base
  belongs_to :phone

  scope :active, -> { where(active: :true) }
end
