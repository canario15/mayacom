ActiveAdmin.register Offer do

  actions :index, :new, :create, :edit, :show, :update

  permit_params :title, :description, :phone_id, :active, :finish_date, :accessory_id, :price, :slider_image, offer_images_attributes: [:image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :_destroy, :id]

  config.batch_actions = false

  filter :active

  action_item only: :show do
    link_to 'Ver en la página', offer_path(offer), :target => "_blank"
  end

  index :title => "Ofertas"  do
    column :active
    column :title
    column :phone
    column :accessory
    column :finish_date
    actions defaults: true do |off|
      link_to "Ver en Página", offer_path(off), :target => "_blank"
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Oferta",  :multipart => true do
      f.input :active
      f.input :finish_date
      f.input :title
      f.input :price
      f.input :phone_id, :as => :select, :collection => Phone.all.collect {|ph| ["#{ph.brand} #{ph.model}", ph.id] }
      f.input :accessory_id, :as => :select, :collection => Accessory.all.collect {|a| [a.title, a.id] }
      f.input :description
      f.input :slider_image, :as => :file, :hint => f.object.slider_image.present? ? image_tag(f.object.slider_image.url(:thumb)) : content_tag(:span, "todavía no hay foto ")
      f.has_many :offer_images, allow_destroy: true  do |r|
        r.input :image, :as => :file, :hint => r.object.image.present? ? image_tag(r.object.image.url(:thumb)) : content_tag(:span, "todavía no hay foto ")
      end
    end
    f.actions
  end

  show :title => :title do |of|
    attributes_table do
      row :active
      row :finish_date
      row :price
      row :phone
      row :accessory
      row :title
      row :description
      row :created_at
      row :updated_at
      row :slider_image do
        image_tag of.slider_image.url(:thumb)
      end
      row "Imágenes" do
        ul do
          of.offer_images.each do |img|
            li do
              image_tag(img.image.url(:thumb))
            end
          end
        end
      end
    end
  end
end
