class ConstituencyWard < ApplicationRecord
  belongs_to :constituency
  belongs_to :ward
end
