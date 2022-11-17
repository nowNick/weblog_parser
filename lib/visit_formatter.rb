# frozen_string_literal: true

class VisitFormatter
  def initialize(line_formatter)
    @line_formatter = line_formatter
  end

  def format(visits)
    visits
      .sort_by { |_key, value| -value }
      .map(&@line_formatter)
      .join("\n")
  end
end
