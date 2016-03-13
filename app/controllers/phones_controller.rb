class PhonesController < ApplicationController

  def index
    @hover_menu = CONSTANT_MENU_PHONES
    @brands = Brand.all
    @search = Phone.search(params[:q])
    @phones = @search.result.page params[:page]
    respond_to do |format|
      if request.xhr?
        format.html  { render partial: 'filter_data.html', :layout => false}
      else
        format.html
      end
    end

  end

  def show
    @phone = Phone.find(params[:id])
    @hover_menu = CONSTANT_MENU_PHONES
  end

end
