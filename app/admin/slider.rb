ActiveAdmin.register Slider do

  permit_params :title, :description, :phone_id, :active, :image, :duration

  config.batch_actions = false

  filter :phone, collection: proc { Phone.all }, as: :select
  filter :active
  filter :title

  index :title => "Slider"  do
    column :active
    column :title
    column :phone
    actions
  end

  form do |f|
    f.inputs "Slider",  :multipart => true do
      f.input :active
      f.input :title
      f.input :phone_id, :as => :select, :collection => Phone.all.collect {|ph| ["#{ph.brand} #{ph.model}", ph.id] }
      f.input :duration, :hint => "Duración en horas de la oferta"
      f.input :description
      f.input :image, :as => :file, :hint => f.object.image.present? ? image_tag(f.object.image.url(:thumb)) : content_tag(:span, "todavía no hay foto ")
    end
    f.actions
  end

  show :title => :title do |co|
    attributes_table do
      row :active
      row :title
      row :phone
      row :duration
      row :description
      row :created_at
      row :updated_at
      row :image do
        image_tag co.image.url(:thumb)
      end
    end
  end


end
