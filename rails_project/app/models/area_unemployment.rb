class AreaUnemployment < ApplicationRecord
  belongs_to :area, polymorphic: true
end
