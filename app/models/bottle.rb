class Bottle < ApplicationRecord
  # Direct associations

  has_many   :pairings,
             :dependent => :destroy

  belongs_to :alcohol

  # Indirect associations

  has_many   :cigars,
             :through => :pairings,
             :source => :cigar

  # Validations

end
