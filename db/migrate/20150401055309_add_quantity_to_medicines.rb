class AddQuantityToMedicines < ActiveRecord::Migration
  def change
    add_column :medicines, :quantity, :string
  end
end
