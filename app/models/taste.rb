class Taste < ApplicationRecord
  # Direct associations

  has_one    :pairing,
             :dependent => :destroy

  has_many   :drinks,
             :dependent => :destroy

  # Indirect associations

  has_many   :alcohols,
             :through => :drinks,
             :source => :alcohol

  # Validations

end
