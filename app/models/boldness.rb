class Boldness < ApplicationRecord
  # Direct associations

  has_one    :pairing,
             :dependent => :destroy

  has_many   :cigars,
             :dependent => :destroy

  # Indirect associations

  has_one    :taste,
             :through => :pairing,
             :source => :taste

  # Validations

end
