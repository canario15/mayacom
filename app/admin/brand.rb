ActiveAdmin.register Brand do

  actions :index, :edit, :show, :update

  menu :label => "Marcas"
  menu parent: "Administración"

  config.filters = false
  config.batch_actions = false

  permit_params :name

end
