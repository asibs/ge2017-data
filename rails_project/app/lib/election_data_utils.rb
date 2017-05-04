module ElectionDataUtils

  # Add '+' on front of positive numbers, leave 0 with nothing, negatives will already get '-'
  def self.swing_to_s(swing)
    return "Unknown" if (swing.nil? || swing == "")

    begin
      (Integer(swing) > 0) ? "+" + swing.to_s : swing.to_s
    rescue ArgumentError
      swing.to_s
    end
  end

end
