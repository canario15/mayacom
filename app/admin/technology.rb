ActiveAdmin.register Technology do

  actions :index, :new, :create, :edit, :show, :update

  menu :label => "Tecnologías"
  menu parent: "Administración"

  config.filters = false
  config.batch_actions = false

  permit_params :name

end
