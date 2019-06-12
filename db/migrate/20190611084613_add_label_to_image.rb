class AddLabelToImage < ActiveRecord::Migration[5.2]
  def change
    add_reference :images, :label, foreign_key: true
  end
end
