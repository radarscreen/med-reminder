class RemoveTHursFromMedicines < ActiveRecord::Migration
  def change
    remove_column :medicines, :thursday, :string
  end
end
