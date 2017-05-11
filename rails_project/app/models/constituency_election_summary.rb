class ConstituencyElectionSummary < ApplicationRecord
  belongs_to :election_rankable, polymorphic: true

  belongs_to :party_1, class_name: "Party"
  belongs_to :party_2, optional: true, class_name: "Party"
  belongs_to :party_3, optional: true, class_name: "Party"
  belongs_to :party_4, optional: true, class_name: "Party"
  belongs_to :party_5, optional: true, class_name: "Party"

  belongs_to :con, optional: true, class_name: "Party"
  belongs_to :lab, optional: true, class_name: "Party"
  belongs_to :ld, optional: true, class_name: "Party"
  belongs_to :grn, optional: true, class_name: "Party"
  belongs_to :ukip, optional: true, class_name: "Party"
  belongs_to :snp, optional: true, class_name: "Party"
  belongs_to :pc, optional: true, class_name: "Party"
end
