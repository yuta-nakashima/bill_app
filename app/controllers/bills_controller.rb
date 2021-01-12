class BillsController < ApplicationController

  def index
    @bills = Bill.all
  end

  def show
    @bill = Bill.find(params[:id])
    @invoice = Invoice.new
    @invoices = @bill.invoices
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bill_params)
    if @bill.save
      redirect_to root_path
    else
      render :index
    end
  end

  def set_search
    @p = Bill.ransack(params[:q])
    @results =@p.result
  end

  def self.search
    Company.where("company_name LIKE(?)", "%#{search}%") if self !=""
  end

  private

  def bill_params
    params.require(:bill).permit(:bill_item,:bill_price,:bill_unit,:company_name)
  end

  def invoice_params
    params.permit(:invoice_item, :invoice_price, :invoice_unit, :invoice_date,:invoice_count,:company_id, :bill_id)
  end

end
