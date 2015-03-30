class RemoveFridayFromMedicines < ActiveRecord::Migration
  def change
    remove_column :medicines, :friday, :string
  end
end
