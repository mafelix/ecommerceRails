class CreateAddInvoiceToOrders < ActiveRecord::Migration
  
  def change
    add_column :orders, :invoice_num, :integer
  end
  # rails model generation does not support sequential keys
  execute "CREATE SEQUENCE orders_invoice_num_seq START 1001"
end