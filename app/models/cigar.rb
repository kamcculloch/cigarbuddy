class Cigar < ApplicationRecord
  mount_uploader :image_url, ImageUrlUploader

  # Direct associations

  belongs_to :profile,
             :class_name => "Boldness",
             :foreign_key => "boldness"

  # Indirect associations

  # Validations

end
