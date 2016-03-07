class Plan < ActiveRecord::Base

  belongs_to :contract
  has_many :phone_plans

  accepts_nested_attributes_for :phone_plans, allow_destroy: true, reject_if: :all_blank

  default_scope { order(order_number: :asc) }
end
