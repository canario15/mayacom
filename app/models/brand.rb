class Brand < ActiveRecord::Base
  has_many :phones
  has_many :accessories

  def to_s
    self.name
  end

  validates_presence_of :name

end
