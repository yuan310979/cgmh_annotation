class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string :MK_type
      t.string :pathogen

      t.timestamps
    end
  end
end
