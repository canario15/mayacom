class AccessoriesController < ApplicationController

  def index
    @hover_menu = CONSTANT_MENU_ACCESORIOES
    @access_types = AccessType.all
    @search = Accessory.search(params[:q])
    @accesories = @search.result.page params[:page]

    respond_to do |format|
      if request.xhr?
        format.html  { render partial: 'filter_data.html', :layout => false}
      else
        format.html
      end
    end
  end

  def show
    @accessory = Accessory.find(params[:id])
    @hover_menu = CONSTANT_MENU_ACCESORIOES
  end

end
