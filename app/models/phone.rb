class Phone < ActiveRecord::Base

  belongs_to :brand
  has_and_belongs_to_many :images_phones


#Fotos
#Lista de Planes
#Lista de Especificaciones
#Lista de Productos relacionados


end
