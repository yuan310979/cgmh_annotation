class Label < ApplicationRecord
    serialize :feature_annotations, Array
    has_many :images
end
