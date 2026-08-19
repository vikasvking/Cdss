class Hemm < ApplicationRecord
  has_many :tyres,dependent: :destroy
end
