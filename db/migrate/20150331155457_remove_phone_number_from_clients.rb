class RemovePhoneNumberFromClients < ActiveRecord::Migration
  def change
    remove_column :clients, :phone_number, :integer
  end
end
