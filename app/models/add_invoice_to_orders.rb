class AddInvoiceToOrders < ActiveRecord::Base
  def self.up
    def change
      add_column :orders, :invoice_num, :integer 

      execute "CREATE SEQUENCE tokens_token_number_seq START 1001"
    end
  end

  def self.down
    execute "DROP SEQUENCE tokens_token_number_seq"
  end
end
