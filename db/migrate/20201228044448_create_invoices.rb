class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string     :invoice_item
      t.integer    :invoice_price
      t.string     :invoice_unit
      t.integer    :invoice_count
      t.date       :invoice_date
      t.integer    :bill_id
      t.timestamps
    end
  end
end
