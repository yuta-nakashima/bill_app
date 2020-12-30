class BillsController < ApplicationController

  def index
  end

  def show
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

  def search
    @p = Bill.ransack(params[:q])
    @results =@p.result.includes(:company)
    @bills = Bill.includes(:company)
  end

  def self.search
    Bill.where("company_id LIKE(?)", "%#{search}%") if self !=""
  end

  private

  def bill_params
    params.require(:bill).permit(:bill_item,:bill_price,:bill_unit,:company_id)
  end

end
