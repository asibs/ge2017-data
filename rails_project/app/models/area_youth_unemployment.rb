class AreaYouthUnemployment < ApplicationRecord
  belongs_to :area, polymorphic: true
end
