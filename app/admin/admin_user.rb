ActiveAdmin.register AdminUser do

  menu parent: "Administración"

  permit_params :email, :password, :password_confirmation

  config.filters = false
  config.batch_actions = false

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  form do |f|
    f.inputs "Detalles del Administrador" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show :title => :email do |ad|
    attributes_table do
      row :email
      row :sign_in_count
      row :current_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_at
      row :last_sign_in_ip
      row :updated_at
      row :created_at
    end
  end

end
