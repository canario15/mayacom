class AddPlanPhoneDescColumnToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :plan_phone_desc, :text
  end
end
