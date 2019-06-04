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
  attr_accessor :matches_played
  attr_accessor :wins
  attr_accessor :draws
  attr_accessor :losses
  attr_accessor :points

  def initialize(name)
    @name = name
    @matches_played = 0
    @wins = 0
    @draws = 0
    @losses = 0
    @points = 0
  end

  def win!
    @matches_played += 1
    @wins += 1
    @points += 3
  end

  def lose!
    @matches_played += 1
    @losses += 1
  end

  def draw!
    @matches_played += 1
    @draws += 1
    @points += 1
  end
end

# Class to print out the results of the tournament
class Table
  HEADER = 'Team                           | MP |  W |  D |  L |  P'
  TEAM_NAME_WIDTH = HEADER.split('|')[0].length

  def initialize(teams)
    @teams = teams
  end

  def print_table!
    table = ''
    table += HEADER + "\n"
    @teams.sort_by { |_k, v| [-v.points, v.name] }.to_h.each_value do |team|
      table += print_line(team) + "\n"
    end
    table
  end

  def print_line(team)
    team.name + calculate_spaces(team) + score_columns(team)
  end

  def calculate_spaces(team)
    spaces = TEAM_NAME_WIDTH - team.name.length
    ' ' * spaces
  end

  def score_columns(team)
    "|  #{team.matches_played} |  #{team.wins} |  #{team.draws} |  #{team.losses} |  #{team.points}"
  end
end
