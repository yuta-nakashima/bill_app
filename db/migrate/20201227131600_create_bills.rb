class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
      t.string     :bill_item
      t.integer    :bill_price
      t.string     :bill_unit
      t.references :company,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
