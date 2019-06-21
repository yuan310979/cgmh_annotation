class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.belongs_to :image, index: true
      t.belongs_to :label, index: true

      t.timestamps
    end
  end
end
