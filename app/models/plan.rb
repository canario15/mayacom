class Plan < ActiveRecord::Base

  belongs_to :contract

  has_many :phone_plans, :dependent => :destroy

  accepts_nested_attributes_for :phone_plans, :allow_destroy => true

  default_scope { order(order_number: :asc) }

  validates_presence_of :order_number, :contract_id, :title, :price, :item_1, :item_2, :item_3, :description


end
