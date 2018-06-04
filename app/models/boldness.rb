class Boldness < ApplicationRecord
  # Direct associations

  has_one    :pairing,
             :dependent => :destroy

  has_many   :cigars,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
