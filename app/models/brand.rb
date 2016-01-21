class Brand < ActiveRecord::Base
  has_many :phones
  has_many :accessories
end
