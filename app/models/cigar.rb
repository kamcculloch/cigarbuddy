class Cigar < ApplicationRecord
  # Direct associations

  has_many   :pairings,
             :dependent => :destroy

  # Indirect associations

  has_many   :bottles,
             :through => :pairings,
             :source => :bottle

  # Validations

end
