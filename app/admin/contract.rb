ActiveAdmin.register Contract do
  menu :label => "Contratos"

  permit_params :technology_id, :title, :short_desc, :logo

  filter :technology, collection: proc { Technology.all }, as: :select
  filter :title

  config.batch_actions = false

  index :title => "Contratos"  do
    column :technology
    column :title
    actions
  end

  form do |f|
    f.inputs "Contrato",  :multipart => true do
      f.input :technology, :as => :select, :collection => Technology.all.collect {|tec| [tec.name, tec.id] }
      f.input :title
      f.input :short_desc
      f.input :logo, :as => :file, :hint => f.object.logo.present? ? image_tag(f.object.logo.url(:thumb)) : content_tag(:span, "todavía no hay foto ")
    end
    f.actions
  end


  show :title => :title do |co|
    attributes_table do
      row :technology
      row :title
      row :short_desc
      row :created_at
      row :updated_at
      row :logo do
        image_tag co.logo.url(:thumb)
      end
    end
  end

end
