ActiveAdmin.register Phone do
  menu :label => "Celulares"
  menu parent: "Productos"

  config.batch_actions = false

  permit_params :brand_id, :phone_type, :model, :mode, :title, :new_price, :old_price, :short_desc, :long_desc, :enter_date, :is_most_view, :is_top_sale, :is_top_new, phone_images_attributes: [:image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :_destroy, :id], specification_attributes: [ :network_attributes => [ :tecno, :band4g, :band3g, :band2g ], :launch_attributes => [:announced, :status], :status_attributes => [ :dimensions, :weight, :build, :sim ], :display_attributes => [ :disp_type, :size, :resolution, :multitouch, :protection ], :platform_attributes => [ :os, :chipset, :cpu, :gpu ], :memory_attributes => [ :internal, :external ], :camera_attributes => [ :primary, :features, :video, :secondary ], :sound_attributes => [ :alerts_type, :loudspeaker, :jack_port ], :comm_attributes => [ :wlan, :bluetooth, :gps, :nfc, :radio, :usb ], :feature_attributes => [ :sensors, :messaging, :browser, :java, :otras ], :battery_attributes => [ :bat_type, :stand_by, :talk_time, :music_play ], :misc_attributes => [ :colors ] ]

  filter :brand, collection: proc { Brand.all }, as: :select
  filter :model
  filter :mode, :as => :select, :collection => [ "Libre" , "Contrato", "Prepago" ]
  filter :is_most_view
  filter :is_top_sale
  filter :is_top_new

  index :title => "Celulares"  do
    column :brand
    column :phone_type
    column :model
    column :mode
    column :new_price
    column :created_at
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Celular",  :multipart => true do
      f.input :brand, :as => :select, :collection => Brand.all.collect {|bra| [bra.name, bra.id] }
      f.input :phone_type, :as => :select, :collection => [ "Celular" , "Tablet" ]
      f.input :model
      f.input :mode, :as => :select, :collection => [ "Libre" , "Contrato", "Prepago" ]
      f.input :title
      f.input :new_price, :hint => "precio por el equipo libre, si es vacio aparacece mensaje para consultar el precio"
      f.input :old_price, :hint => "si se carga este precio aparecera tachado"
      f.input :short_desc, :as => :string, :hint => "no menos de 140 caracteres"
      f.input :long_desc
      f.input :enter_date
      f.input :is_most_view
      f.input :is_top_sale
      f.input :is_top_new
      f.has_many :phone_images, allow_destroy: true do |r|
        r.input :image, :as => :file, :hint => r.object.image.present? ? image_tag(r.object.image.url(:thumb)) : content_tag(:span, "todavía no hay foto (entre 767px y 1100px cuadrada)")
      end

      f.has_many :specification do |s|
        s.has_many :network do |n|
          n.input :tecno
          n.input :band4g
          n.input :band3g
          n.input :band2g
        end
        s.has_many :launch do |l|
          l.input :announced
          l.input :status
        end
        s.has_many :status do |st|
          st.input :dimensions
          st.input :weight
          st.input :build
          st.input :sim
        end
        s.has_many :display do |d|
          d.input :disp_type
          d.input :size
          d.input :resolution
          d.input :multitouch
          d.input :protection
        end
        s.has_many :platform do |p|
          p.input :os
          p.input :chipset
          p.input :cpu
          p.input :gpu
        end
        s.has_many :memory do |m|
          m.input :internal
          m.input :external
        end
        s.has_many :camera do |c|
          c.input :primary
          c.input :features
          c.input :video
          c.input :secondary
        end
        s.has_many :sound do |so|
          so.input :alerts_type
          so.input :loudspeaker
          so.input :jack_port
        end
        s.has_many :comm do |co|
          co.input :wlan
          co.input :bluetooth
          co.input :gps
          co.input :nfc
          co.input :radio
          co.input :usb
        end
        s.has_many :feature do |fe|
          fe.input :sensors
          fe.input :messaging
          fe.input :browser
          fe.input :java
          fe.input :otras
        end
        s.has_many :battery do |b|
          b.input :bat_type
          b.input :stand_by
          b.input :talk_time
          b.input :music_play
        end
        s.has_many :misc do |mi|
          mi.input :colors, :as => :string
        end
      end
    end
    f.actions
  end

  show do
    # renders app/views/admin/phone/_show.html.erb
    render 'show'
  end

end
