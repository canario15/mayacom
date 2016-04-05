ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, label: proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ "Inicio" } do

    columns do
      column do
        panel "Celulares más vistos" do
          table_for Phone.where(is_most_view: true).last(2) do
            column("Marca") { |phone| phone.brand      }
            column("Tipo")  { |phone| phone.phone_type }
            column("Model") { |phone| phone.model      }
            column("Modo")  { |phone| phone.mode       }
            column("Acciones") { |phone| link_to("ver", admin_phone_path(phone)) }
          end
        end
        panel "Aceesorios más vistos" do
          table_for Accessory.where(is_most_view: true).last(2) do
            column("Tipo" )    { |accessory| accessory.access_type }
            column("Titulo")   { |accessory| accessory.title       }
            column("Precio")   { |accessory| accessory.new_price   }
            column("Acciones") { |accessory| link_to("ver", admin_accessory_path(accessory)) }
          end
        end
      end
      column do
        panel "Celulares más vendidos" do
          table_for Phone.where(is_top_sale: true).last(2) do
            column("Marca") { |phone| phone.brand      }
            column("Tipo")  { |phone| phone.phone_type }
            column("Model") { |phone| phone.model      }
            column("Modo")  { |phone| phone.mode       }
            column("Acciones") { |phone| link_to("ver", admin_phone_path(phone)) }
          end
        end
        panel "Aceesorios más vendidos" do
          table_for Accessory.where(is_top_sale: true).last(2) do
            column("Tipo" )    { |accessory| accessory.access_type }
            column("Titulo")   { |accessory| accessory.title       }
            column("PRecio")   { |accessory| accessory.new_price   }
            column("Acciones") { |accessory| link_to("ver", admin_accessory_path(accessory)) }
          end
        end
      end
      column do
        panel "Celualres top nuevos" do
          table_for Phone.where(is_top_new: true).last(2) do
            column("Marca") { |phone| phone.brand      }
            column("Tipo")  { |phone| phone.phone_type }
            column("Model") { |phone| phone.model      }
            column("Modo")  { |phone| phone.mode       }
            column("Acciones") { |phone| link_to("ver", admin_phone_path(phone)) }
          end
        end
        panel "Aceesorios top nuevos" do
          table_for Accessory.where(is_top_new: true).last(2) do
            column("Tipo" )    { |accessory| accessory.access_type }
            column("Titulo")   { |accessory| accessory.title       }
            column("PRecio")   { |accessory| accessory.new_price   }
            column("Acciones") { |accessory| link_to("ver", admin_accessory_path(accessory)) }
          end
        end
      end
    end # columns
  end
end
