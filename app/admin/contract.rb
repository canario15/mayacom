ActiveAdmin.register Contract do

  actions :index, :edit, :show, :update

  menu :label => "Contratos"

  permit_params :technology_id, :title, :short_desc, :logo, :order

  filter :technology, collection: proc { Technology.all }, as: :select
  filter :title

  config.batch_actions = false

  index :title => "Contratos"  do
    column :order
    column :technology
    column :title
    actions defaults: true do |contr|
      link_to "Ver en Página", contracts_path(), :target => "_blank"
    end
  end

  form do |f|
    f.inputs "Contrato",  :multipart => true do
      f.input :order
      f.input :technology, :as => :select, :collection => Technology.all.collect {|tec| [tec.name, tec.id] }
      f.input :title
      f.input :short_desc
      f.input :logo, :as => :file, :hint => f.object.logo.present? ? image_tag(f.object.logo.url(:thumb)) : content_tag(:span, "todavía no hay foto ")
    end
    f.actions
  end

  show :title => :title do |co|
    attributes_table do
      row :order
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
