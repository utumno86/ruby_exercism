# frozen_string_literal: true

# Class for determing the sum of multiple resistor color values
class ResistorColorDuo
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze
  def self.value(colors)
    new.value(colors)
  end

  def value(colors)
    colors.map { |color| COLORS.index(color) }.join('').to_i
  end
end
