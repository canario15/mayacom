class ContractsController < ApplicationController

  def index
    @hover_menu = CONSTANT_MENU_CONTRACTS
    @contracts = Contract.all
  end

  def show
    @contract = Contract.find(params[:id])
    @plan =  @contract.plans.find(params[:plan_id])
    @hover_menu = CONSTANT_MENU_CONTRACTS
  end

  def next_or_prev_plan
    actual_plan = Plan.find(params[:plan_id])
    @contract = actual_plan.contract
    if params[:option] == "mayor"
       @plan = @contract.plans.find_by_order_number(actual_plan.order_number + 1 )
    else
      if params[:option] == "menor"
        @plan = @contract.plans.find_by_order_number(actual_plan.order_number - 1 )
      end
    end
    respond_to do |format|
      format.html { render partial: 'plan', :layout => false}
    end
  end

end
