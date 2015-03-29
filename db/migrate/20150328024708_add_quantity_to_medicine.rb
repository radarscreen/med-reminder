class AddQuantityToMedicine < ActiveRecord::Migration
  def change
    add_column :medicines, :quantity, :integer
  end
end
