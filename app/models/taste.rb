class Taste < ApplicationRecord
  # Direct associations

  has_one    :pairing,
             :dependent => :destroy

  has_many   :drinks,
             :dependent => :destroy

  # Indirect associations

  has_one    :boldness,
             :through => :pairing,
             :source => :boldness

  has_many   :alcohols,
             :through => :drinks,
             :source => :alcohol

  # Validations

end
