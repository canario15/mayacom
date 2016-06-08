ActiveAdmin.register AccessType do

  actions :index, :new, :create, :edit, :show, :update

  menu :label => "Tipos de accesorios"
  menu parent: "Administración"

  config.filters = false
  config.batch_actions = false

  permit_params :name


end
