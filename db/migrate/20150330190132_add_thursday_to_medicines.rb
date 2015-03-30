class AddThursdayToMedicines < ActiveRecord::Migration
  def change
    add_column :medicines, :thursday, :string
  end
end
