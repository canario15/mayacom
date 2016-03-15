ActiveAdmin.register Accessory do
  menu :label => "Accesorios"
  menu parent: "Productos"

  permit_params :title, :new_price, :old_price, :access_type_id, :short_desc, :long_desc, :is_most_view, :is_top_sale, :is_top_new, accessory_images_attributes: [:image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :_destroy, :id], phone_ids: []

  config.batch_actions = false

  filter :title
  filter :access_type
  filter :is_most_view
  filter :is_top_sale
  filter :is_top_new

  index :title => "Accesorios"  do
    column :access_type
    column :title
    column :new_price
    actions
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Accesorio",  :multipart => true do
      f.input :access_type, :as => :select, :collection => AccessType.all.collect {|type| [type.name, type.id] }
      f.input :title
      f.input :new_price
      f.input :old_price
      f.input :short_desc
      f.input :long_desc
      f.input :is_most_view
      f.input :is_top_sale
      f.input :is_top_new
      f.input :phones, as: :select, :collection => Phone.all.collect {|ph| ["#{ph.brand} #{ph.model}", ph.id] }
      f.has_many :accessory_images, allow_destroy: true  do |r|
        r.input :image, :as => :file, :hint => r.object.image.present? ? image_tag(r.object.image.url(:thumb)) : content_tag(:span, "todavía no hay foto ")
      end
    end
    f.actions
  end

  show :title => :title do |ac|
    attributes_table do
      row :access_type
      row :title
      row :new_price
      row :old_price
      row :short_desc
      row :long_desc
      row :is_most_view
      row :is_top_sale
      row :is_top_new
      row :created_at
      row 'Teléfonos compatibles' do |acce|
        (acce.phones.map { |ph| "#{ph.brand} #{ph.model}" }).join(", ")
      end
      row "Imágenes" do
        ul do
          ac.accessory_images.each do |img|
            li do
              image_tag(img.image.url(:thumb))
            end
          end
        end
      end
    end
  end



end
