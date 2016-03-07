class Contract < ActiveRecord::Base

  belongs_to :technology
  has_many :plans

  has_attached_file :logo, styles: { index: "250x160" , thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  def lower_plan
    unless plans.first.blank?
      plans.first.price
    else
      0
    end
  end

end
