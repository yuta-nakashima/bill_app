class InvoicesController < ApplicationController

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      redirect_to new_invoice_path
    else
      render :new
    end
  end


    private

    def invoice_params
      params.require(:invoice).permit(:invoice_item, :invoice_price, :invoice_unit, :invoice_total, :invoice_tax, :invoice_date, :comment, :company_id).merge(user_id: current_user.id)
    end

end
