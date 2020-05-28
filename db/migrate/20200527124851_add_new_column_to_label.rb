class AddNewColumnToLabel < ActiveRecord::Migration[5.2]
  def change
    add_column :labels, :feature_annotations, :text
    change_table :labels do |t|
      t.rename :MK_type, :major_dx_class
      t.rename :pathogen, :dx_subclass
    end
  end
end
