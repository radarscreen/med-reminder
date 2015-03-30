class RemoveTuesdayFromMedicines < ActiveRecord::Migration
  def change
    remove_column :medicines, :tuesday, :string
  end
end
