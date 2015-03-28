class CreateTimeCombos < ActiveRecord::Migration
  def change
    create_table :time_combos do |t|

      t.timestamps null: false
    end
  end
end
