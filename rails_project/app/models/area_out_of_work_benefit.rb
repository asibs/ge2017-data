class AreaOutOfWorkBenefit < ApplicationRecord
  belongs_to :area, polymorphic: true
end
