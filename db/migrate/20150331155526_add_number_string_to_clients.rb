class AddNumberStringToClients < ActiveRecord::Migration
  def change
    add_column :clients, :phone_number, :string
  end
end
