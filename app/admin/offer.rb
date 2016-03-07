ActiveAdmin.register Offer do

  permit_params :title, :description, :phone_id, :active

  config.batch_actions = false

  filter :phone, collection: proc { Phone.all }, as: :select
  filter :active

  index :title => "Ofertas"  do
    column :active
    column :title
    column :phone
    actions
  end

  form do |f|
    f.inputs "Celular",  :multipart => true do
      f.input :active
      f.input :title
      f.input :phone_id, :as => :select, :collection => Phone.all.collect {|ph| ["#{ph.brand} #{ph.model}", ph.id] }
      f.input :description
    end
    f.actions
  end

  show :title => :title do |co|
    attributes_table do
      row :active
      row :phone
      row :title
      row :description
      row :created_at
      row :updated_at
    end
  end
end
