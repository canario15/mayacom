ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, label: proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ "Inicio" } do

    columns do
      column do
        panel "Nuevos equipos" do
          table_for Phone.last(10) do
            column("Marca") { |phone| phone.brand      }
            column("Tipo")  { |phone| phone.phone_type }
            column("Model") { |phone| phone.model      }
            column("Modo")  { |phone| phone.mode       }
            column("Acciones")      { |phone| link_to("ver", admin_phone_path(phone)) }
          end
        end
      end
      column do
        panel "Nuevos Accesorios" do
          table_for Accessory.last(10) do
            column("Tipo")     { |accessory| accessory.access_type }
            column("Titulo")   { |accessory| accessory.title       }
            column("PRecio")   { |accessory| accessory.new_price   }
            column("Acciones") { |accessory| link_to("ver", admin_accessory_path(accessory)) }
          end
        end
      end
      column do
        panel "Nuevas Ofertas" do
          table_for Offer.last(10) do
            column("Estado")    { |offer| offer.active      }
            column("Titulo")    { |offer| offer.title       }
            column("Teléfono")  { |offer| offer.phone       }
            column("Accesorio") { |offer| offer.accessory   }
            column("Fecha fin") { |offer| offer.finish_date }
            column("Acciones")  { |offer| link_to("ver", admin_offer_path(offer)) }
          end
        end
      end
    end # columns
  end
end
