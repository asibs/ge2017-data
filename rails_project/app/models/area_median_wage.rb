class AreaMedianWage < ApplicationRecord
  belongs_to :area, polymorphic: true
end
