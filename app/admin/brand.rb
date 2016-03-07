ActiveAdmin.register Brand do
  menu :label => "Marcas"
  menu parent: "Administración"

  config.filters = false
  config.batch_actions = false

  permit_params :name

end
