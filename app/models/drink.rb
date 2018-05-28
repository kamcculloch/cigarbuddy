class Drink < ApplicationRecord
  mount_uploader :image_url, ImageUrlUploader

  # Direct associations

  belongs_to :taste

  belongs_to :alcohol

  # Indirect associations

  # Validations

end
