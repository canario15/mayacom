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
    self.network = Network.create if self.network.nil?
    self.launch = Launch.create if self.launch.nil?
    self.status = Status.create if self.status.nil?
    self.display = Display.create if self.display.nil?
    self.platform = Platform.create if self.platform.nil?
    self.memory = Memory.create if self.memory.nil?
    self.camera = Camera.create if self.camera.nil?
    self.sound = Sound.create if self.sound.nil?
    self.comm = Comm.create if self.comm.nil?
    self.feature = Feature.create if self.feature.nil?
    self.battery = Battery.create if self.battery.nil?
    self.misc = Misc.create if self.misc.nil?
  end

end
