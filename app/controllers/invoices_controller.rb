class InvoicesController < ApplicationController

  def new
    @form = Form::InvoiceCollection.new
    #@bill = Bill.find(params[:bill_id])
  end

  def create
    @form = Form::InvoiceCollection.new(invoice_params)
    binding.pry
    if @form.save
      redirect_to bills_path
    else
      redirect_to bills_search_path
    end

  end


    private

    def invoice_params
      params.require(:form_invoice_collection).permit(invoices_attributes:[:invoice_item, :invoice_price, :invoice_unit, :invoice_total, :invoice_tax, :invoice_date, :invoice_comment, :company_id,:invoice_count])#.merge(user_id: current_user.id)
    end

end
