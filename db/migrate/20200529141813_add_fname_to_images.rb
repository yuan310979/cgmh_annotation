class AddFnameToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :fname, :string
  end
end
