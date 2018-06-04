class Alcohol < ApplicationRecord
  # Direct associations

  has_many   :bottles,
             :class_name => "Drink",
             :dependent => :destroy

  # Indirect associations

  has_many   :tastes,
             :through => :bottles,
             :source => :taste

  # Validations

end
