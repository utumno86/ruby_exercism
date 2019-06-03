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
      @teams[team].mp += 1
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
    @teams[winner].w += 1
    @teams[winner].p += 3
    @teams[loser].l += 1
  end

  def draw(*teams)
    teams.each do |team|
      @teams[team].d += 1
      @teams[team].p += 1
    end
  end

  def print_table
    table = ''
    table += HEADER + "\n"
    @teams.sort_by { |_k, v| [-v.p, v.name] }.to_h.each_value do |team|
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
    "|  #{team.mp} |  #{team.w} |  #{team.d} |  #{team.l} |  #{team.p}"
  end
end

# class to keep track of relevant information about teams
class Team
  attr_accessor :name
  attr_accessor :mp
  attr_accessor :w
  attr_accessor :d
  attr_accessor :l
  attr_accessor :p

  def initialize(name)
    @name = name
    @mp = 0
    @w = 0
    @d = 0
    @l = 0
    @p = 0
  end
end
