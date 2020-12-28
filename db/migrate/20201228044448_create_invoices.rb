class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string     :invoice_item
      t.integer    :invoice_price
      t.string     :invoice_unit
      t.integer    :invoice_count
      t.integer    :invoice_total
      t.integer    :invoice_tax
      t.datetime   :invoice_date
      t.text       :comment
      t.references :company,  null: false, foreign_key: true
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end