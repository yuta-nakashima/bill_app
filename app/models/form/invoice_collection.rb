class Form::InvoiceCollection < Form::Base
  FORM_COUNT = 20
  attr_accessor :invoices
  
    def initialize(attributes = {})
      super attributes
      self.invoices = FORM_COUNT.times.map{Invoice.new()} unless self.invoices.present?
    end
  
    def invoices_attributes=(attributes)
      self.invoices = attributes.map{|_, v| Invoice.new(v)}
    end
  
    def save
      Invoice.transaction do
        self.invoices.map(&:save!)
      end
        return true
    rescue => edit
        return false
    end

end
