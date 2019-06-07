# frozen_string_literal: true

# class to return a table of tournament wins/losses
class Tournament
  def self.tally(input)
    new.tally(input)
  end

  def tally(input)
    @teams = Hash.new { |hash, key| hash[key] = Team.new(key) }
    input.split("\n").each do |line|
      calculate_scores(line) if line
    end

    Table.new(@teams).print_table!
  end

  def calculate_scores(input)
    first_team, second_team, action = input.split(';')
    calculate_stats(first_team, second_team, action)
  end

  def calculate_stats(first_team, second_team, action)
    first_team = @teams[first_team]
    second_team = @teams[second_team]
    case action
    when 'win'
      first_team.win!
      second_team.lose!
    when 'loss'
      first_team.lose!
      second_team.win!
    when 'draw'
      first_team.draw!
      second_team.draw!
    end
  end
end

# class to keep track of relevant information about teams
class Team
  attr_accessor :name
  attr_accessor :wins
  attr_accessor :draws
  attr_accessor :losses

  def initialize(name)
    @name = name
    @wins = 0
    @draws = 0
    @losses = 0
  end

  def win!
    @wins += 1
  end

  def lose!
    @losses += 1
  end

  def draw!
    @draws += 1
  end

  def points
    @wins * 3 + @draws
  end

  def matches_played
    @wins + @losses + @draws
  end
end

# Class to print out the results of the tournament
class Table
  HEADER = %w[Team MP W D L P]

  def initialize(teams)
    @teams = teams
  end

  def print_table!
    [print_line(HEADER)]
      .concat(sorted_teams.map { |team| print_line(score_columns(team)) })
      .join("\n")
      .concat("\n")
  end

  def sorted_teams
    @teams.sort_by { |_k, v| [-v.points, v.name] }.map { |_, value| value }
  end

  def print_line(data)
    '%-30s |%3s |%3s |%3s |%3s |%3s' % data
  end

  def score_columns(team)
    [team.name, team.matches_played, team.wins, team.draws, team.losses, team.points]
  end
end
