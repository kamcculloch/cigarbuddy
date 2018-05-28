class Bottle < ApplicationRecord
  # Direct associations

  has_many   :pairings,
             :dependent => :destroy

  belongs_to :alcohol

  # Indirect associations

  # Validations

end
