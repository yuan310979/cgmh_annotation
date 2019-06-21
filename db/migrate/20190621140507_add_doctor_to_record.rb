class AddDoctorToRecord < ActiveRecord::Migration[5.2]
  def change
      add_reference :records, :user, index: true
  end
end
