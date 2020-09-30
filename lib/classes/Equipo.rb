# @author Alex Cámara
class Equipo
  # @return [String] the name of the team.
  attr_accessor :nombre

  # @return [Array] the players in the team.
  attr_accessor :jugadores

  # @param nombre [String] the name of the team.
  # @raise [ArgumentError] when the attribute 'nombre' is an empty string or is not a string.
  def initialize(nombre)
    raise ArgumentError, 'El equipo debe tener un nombre...' unless nombre.is_a?(String) && !nombre.empty?

    @nombre = nombre
    @jugadores = []
  end

  def to_json(*_args)
    @jugadores.map do |jugador|
      jugador.to_hash
    end.to_json
  end

  # Adds a single Jugador to the 'jugadores' array.
  #
  # @param player [Jugador] the player to be added.
  # @return [Array] the players in the 'jugadores' array.
  def add_player(player)
    @jugadores.push(player)
  end

  # Adds a one or more objects 'Jugador' to the 'jugadores' array.
  #
  # @param players [Array(Jugador)] the players to be added.
  # @return [Array] the players in the 'jugadores' array.
  def add_players(players)
    players.each do |player|
      @jugadores.push(player)
    end
  end

  # Gets the bono percentage of the team.

  # @note This percentage is obtained by the correlation between the total minimal goals in each player
  #   level and the total actual goals made by the players.
  # @example
  #   given the following players in the same team:
  #
  #     jugador1 = Jugador.new('Juan Perez', 10, 50_000, 25_000, equipo, @nivel_C)
  #     jugador2 = Jugador.new('El Rulo', 9, 30_000, 15_000, equipo, @nivel_B)
  #
  #   the team bonus should be the relation between total goals dictated by their levels
  #   and the total goals they actually made. In this case:
  #
  #     total goals made by the players: 19
  #     total goals dictated by their levels: 25
  #     team bono percentage: 76
  #
  # @return [Float] the team bono percentage.
  def get_team_bono_percentage
    total_goals = 0
    total_minimal_goals = 0
    @jugadores.each do |player|
      total_goals += player.goles
      total_minimal_goals += player.nivel.goles_mes
    end
    total_goals / (total_minimal_goals.to_f / 100)
  end
end
