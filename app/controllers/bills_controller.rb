class BillsController < ApplicationController

  def index
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bill_params)
    if @bill.save
      redirect_to 
    else
      render :index
    end
  end

  private

  def bill_params
    params.require(:bill).permit(:bill_item,:bill_price,:bill_unit,:company_id)
  end

end
