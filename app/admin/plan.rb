ActiveAdmin.register Plan do

  actions :index, :new, :create, :edit, :show, :update

  menu :label => "Planes"

  permit_params :title, :order_number, :item_1, :item_2, :item_3, :price, :description, :plan_phone_desc, :contract_id, phone_plans_attributes: [:phone_id, :price,  :_destroy, :id ]

  config.batch_actions = false

  filter :title
  filter :contract

  index :title => "Planes"  do
    column :order_number
    column :title
    column :price
    column :contract
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Plan",  :multipart => true do
      f.input :order_number, :hint => "orden del plan. ej plan vera 630 es 1 plan vera 990 es 4"
      f.input :contract, :as => :select, :collection => Contract.all.collect {|con| [con.title, con.id] }
      f.input :title, :hint => "vera LTE $630 con límite. ej"
      f.input :price, :hint => "630. ej"
      f.input :item_1, :hint => "3 GB para navegar. ej"
      f.input :item_2, :hint => "20/2 megas velocidad"
      f.input :item_3, :hint => "5 destinos GRATIS. ej"
      f.input :description, :hint => "en código HTML"
      f.input :plan_phone_desc, :hint => "en código HTML"
      f.has_many :phone_plans, allow_destroy: true  do |r|
        r.input :phone, as: :select, :input_html => { :class => 'plan-phone-plans-phone'}, :collection => Phone.all.collect {|ph| ["#{ph.brand} #{ph.model}", ph.id] }
        r.input :price, :hint => "Incluido o $1500. ej"
      end
    end
    f.actions
  end

  show :title => :title do |co|
    attributes_table do
      row :order_number
      row :contract
      row :title
      row :price
      row :item_1
      row :item_2
      row :item_3
      row :created_at
      row :updated_at
      row :description
      row :plan_phone_desc
      row "Teléfonos" do
        ul do
          co.phone_plans.each do |pp|
            li do
              "#{pp.phone} - #{pp.price} con #{co.title}"
            end
          end
        end
      end
    end
  end
end
