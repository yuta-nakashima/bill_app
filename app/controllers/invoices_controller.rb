class InvoicesController < ApplicationController
  
  def index
    @form = Invoice.new
  end

  def new
    @form = Invoice.new #Form::InvoiceCollection.new
    #@bill = Bill.find(params[:bill_id])
  end

  def create
    @invoice = Invoice.create(invoice_params) #Form::InvoiceCollection.new(invoice_params)
    if @invoice.save
      redirect_to bills_path
    else
      redirect_to new_invoice_path
    end

  end


    private

    def invoice_params
      params.require(:invoice).permit(:invoice_item, :invoice_price, :invoice_unit, :invoice_date,:invoice_count).merge(bill_id: params[:bill_id])
    end

end
