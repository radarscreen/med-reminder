class AddFrequencyToMedicines < ActiveRecord::Migration
  def change
    add_column :medicines, :frequency, :string
  end
end
