class Specification < ActiveRecord::Base

  belongs_to :phone
  has_one :network, :dependent => :delete
  has_one :launch, :dependent => :delete
  has_one :status, :dependent => :delete
  has_one :display, :dependent => :delete
  has_one :platform, :dependent => :delete
  has_one :memory, :dependent => :delete
  has_one :camera, :dependent => :delete
  has_one :sound, :dependent => :delete
  has_one :comm, :dependent => :delete
  has_one :feature, :dependent => :delete
  has_one :battery, :dependent => :delete
  has_one :misc, :dependent => :delete

  accepts_nested_attributes_for :network
  accepts_nested_attributes_for :launch
  accepts_nested_attributes_for :status
  accepts_nested_attributes_for :display
  accepts_nested_attributes_for :platform
  accepts_nested_attributes_for :memory
  accepts_nested_attributes_for :camera
  accepts_nested_attributes_for :sound
  accepts_nested_attributes_for :comm
  accepts_nested_attributes_for :feature
  accepts_nested_attributes_for :battery
  accepts_nested_attributes_for :misc

  after_create :create_data

  def create_data
    self.network = Network.create(tecno: "", band4g: "", band3g: "", band2g: "" ) if self.network.nil?
    self.launch = Launch.create(announced: "", status: "") if self.launch.nil?
    self.status = Status.create(dimensions: "", weight: "", build: "", sim: "" ) if self.status.nil?
    self.display = Display.create(disp_type: "", size: "", resolution: "", multitouch: "", protection: "" ) if self.display.nil?
    self.platform = Platform.create(os: "", chipset: "", cpu: "", gpu: "" ) if self.platform.nil?
    self.memory = Memory.create(internal: "", external: "" ) if self.memory.nil?
    self.camera = Camera.create(primary: "", features: "", video: "", secondary: "" ) if self.camera.nil?
    self.sound = Sound.create(alerts_type: "", loudspeaker: "", jack_port: "" ) if self.sound.nil?
    self.comm = Comm.create(wlan: "", bluetooth: "", gps: "", nfc: "", radio: "", usb: "" ) if self.comm.nil?
    self.feature = Feature.create(sensors: "", messaging: "", browser: "", java: "", otras: "" ) if self.feature.nil?
    self.battery = Battery.create(bat_type: "", stand_by: "", talk_time: "", music_play: "" ) if self.battery.nil?
    self.misc = Misc.create(colors: "") if self.misc.nil?
  end

end


