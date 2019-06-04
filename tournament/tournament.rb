# frozen_string_literal: true

# class to return a table of tournament wins/losses
class Tournament
  HEADER = 'Team                           | MP |  W |  D |  L |  P'
  TEAM_NAME_WIDTH = HEADER.split('|')[0].length

  def self.tally(input)
    new.tally(input)
  end

  def tally(input)
    @teams = {}
    input.split("\n").each do |line|
      calculate_scores(line) if line
    end
    print_table
  end

  def calculate_scores(input)
    first_team, second_team, action = input.split(';')
    initialize_teams(first_team, second_team) if second_team
    calculate_stats(first_team, second_team, action)
  end

  def initialize_teams(*teams)
    teams.each do |team|
      @teams[team] = Team.new(team) unless @teams.key?(team)
      @teams[team].matches_played += 1
    end
  end

  def calculate_stats(first_team, second_team, action)
    case action
    when 'win'
      win(first_team, second_team)
    when 'loss'
      win(second_team, first_team)
    when 'draw'
      draw(first_team, second_team)
    end
  end

  def win(winner, loser)
    @teams[winner].wins += 1
    @teams[winner].points += 3
    @teams[loser].losses += 1
  end

  def draw(*teams)
    teams.each do |team|
      @teams[team].draws += 1
      @teams[team].points += 1
    end
  end

  def print_table
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
end
