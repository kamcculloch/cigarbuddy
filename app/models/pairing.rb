class Pairing < ApplicationRecord
  # Direct associations

  belongs_to :bottle

  belongs_to :cigar

  # Indirect associations

  # Validations

end
