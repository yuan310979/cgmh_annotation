require 'csv'

class Record < ApplicationRecord
  belongs_to :image
  belongs_to :label
  belongs_to :user

  validates :image_id, presence: true
  validates :label_id, presence: true
  validates :user_id, presence: true

  def self.to_csv
    attributes = %w{user_id filename image_id major_dx_class dx_subclass feature_annotations}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |r|
        record = [r.user_id, r.image.fname,  r.image_id, r.label.major_dx_class, r.label.dx_subclass, r.label.feature_annotations]
        csv << record
      end
    end
  end
end
