class AccessoriesController < ApplicationController

  def index
    @hover_menu = CONSTANT_MENU_ACCESORIOES
    @accesories = Accessory.page params[:page]
    @access_types = AccessType.all
  end

  def show
    @accessory = Accessory.find(params[:id])
    @hover_menu = CONSTANT_MENU_ACCESORIOES
  end

end
