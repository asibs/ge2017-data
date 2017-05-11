class AreaSummary < ApplicationRecord
  belongs_to :area, polymorphic: true
end
