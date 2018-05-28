class Alcohol < ApplicationRecord
  # Direct associations

  has_many   :bottles,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
