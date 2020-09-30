class Equipo
  attr_accessor :nombre
  attr_accessor :jugadores

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

  def add_player(player)
    @jugadores.push(player)
  end

  def add_players(players)
    players.each do |player|
      @jugadores.push(player)
    end
  end

  # This percentage is obtained by the correlation between the total minimal goals in each player
  # level and the total actual goals made by the players.
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
