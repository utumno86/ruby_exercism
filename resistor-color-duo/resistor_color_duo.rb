# frozen_string_literal: true

# Class for determing the sum of multiple resistor color values
class ResistorColorDuo
  COLORS = {
    'black': '0',
    'brown': '1',
    'red': '2',
    'orange': '3',
    'yellow': '4',
    'green': '5',
    'blue': '6',
    'violet': '7',
    'grey': '8',
    'white': '9'
  }.freeze
  def self.value(colors)
    colors.map { |color| COLORS[color.to_sym] }.join.to_i
  end
end
