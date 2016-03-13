class Offer < ActiveRecord::Base

  belongs_to :phone

  scope :active, -> { where(active: :true) }

  paginates_per 9

  validates_presence_of :title, :phone_id, :description

end
