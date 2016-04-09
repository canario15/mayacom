ActiveAdmin.register Technology do

  actions :index, :edit, :show, :update

  menu :label => "Tecnologías"
  menu parent: "Administración"

  config.filters = false
  config.batch_actions = false

  permit_params :name

end
