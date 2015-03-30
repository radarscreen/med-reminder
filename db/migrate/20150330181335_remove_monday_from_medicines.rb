class RemoveMondayFromMedicines < ActiveRecord::Migration
  def change
    remove_column :medicines, :monday, :string
  end
end
