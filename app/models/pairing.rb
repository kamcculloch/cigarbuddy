class Pairing < ApplicationRecord
  # Direct associations

  belongs_to :taste

  belongs_to :boldness

  # Indirect associations

  # Validations

end
