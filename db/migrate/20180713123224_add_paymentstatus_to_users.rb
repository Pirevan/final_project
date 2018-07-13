class AddPaymentstatusToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :paymentstatus, :integer, default:0
  end
end
