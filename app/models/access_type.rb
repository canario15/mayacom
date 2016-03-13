class AccessType < ActiveRecord::Base

  def to_s
    name
  end

  validates_presence_of :name

end
