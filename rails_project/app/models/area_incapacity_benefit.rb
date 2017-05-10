class AreaIncapacityBenefit < ApplicationRecord
  belongs_to :area, polymorphic: true
end
