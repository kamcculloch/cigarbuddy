class Cigar < ApplicationRecord
  mount_uploader :image_url, ImageUrlUploader

  # Direct associations

  belongs_to :profile,
             :class_name => "Boldness",
             :foreign_key => "boldness_id"

  # Indirect associations

  # Validations

end
