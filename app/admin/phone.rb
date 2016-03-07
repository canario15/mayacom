ActiveAdmin.register Phone do
  menu :label => "Celulares"
  menu parent: "Productos"

  config.batch_actions = false

  permit_params :brand_id, :phone_type, :model, :mode, :title, :new_price, :old_price, :short_desc, :long_desc, :enter_date, :is_most_view, :is_top_sale, :is_top_new, phone_images_attributes: [:image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :_destroy, :id]

  filter :brand, collection: proc { Brand.all }, as: :select
  filter :model
  filter :mode, collection: [ "Libre" , "Contrato" ]
  filter :is_most_view
  filter :is_top_sale
  filter :is_top_new

  index :title => "Celulares"  do
    column :brand
    column :phone_type
    column :model
    column :mode
    column :new_price
    column :created_at
    actions
  end

  form do |f|
    f.inputs "Celular",  :multipart => true do
      f.input :brand, :as => :select, :collection => Brand.all.collect {|bra| [bra.name, bra.id] }
      f.input :phone_type, :as => :select, :collection => [ "Celular" , "Tablet" ]
      f.input :model
      f.input :mode, :as => :select, :collection => [ "Libre" , "Contrato" ]
      f.input :title
      f.input :new_price
      f.input :old_price
      f.input :short_desc
      f.input :long_desc
      f.input :enter_date
      f.input :is_most_view
      f.input :is_top_sale
      f.input :is_top_new
      f.has_many :phone_images, allow_destroy: true  do |r|
        r.input :image, :as => :file, :hint => r.object.image.present? ? image_tag(r.object.image.url(:thumb)) : content_tag(:span, "todavía no hay foto ")
      end
    end
    f.actions
  end

  show :title => :title do |ac|
    attributes_table do
      row :brand
      row :phone_type
      row :model
      row :mode
      row :title
      row :new_price
      row :old_price
      row :short_desc
      row :long_desc
      row :enter_date
      row :is_most_view
      row :is_top_sale
      row :is_top_new
      row :created_at
      row :updated_at
      row 'Accesorios compatibles' do |acce|
        (acce.accessories.map { |ph| "#{ph.brand} #{ph.access_type}" }).join(", ")
      end
      row "Imágenes" do
        ul do
          ac.phone_images.each do |img|
            li do
              image_tag(img.image.url(:thumb))
            end
          end
        end
      end
    end
  end

end
