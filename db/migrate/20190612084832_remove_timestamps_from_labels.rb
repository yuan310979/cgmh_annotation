class RemoveTimestampsFromLabels < ActiveRecord::Migration[5.2]
  def change
    remove_column :labels, :created_at, :string
    remove_column :labels, :updated_at, :string
  end
end
