require_relative '../classes/Jugador'
require_relative '../classes/Equipo'
require_relative '../classes/Nivel'
require 'json'

# @author Alex Cámara
module JSON_utilities
  # Instantiation of the levels specified in the problem
  # @return [Nivel] level A.
  @nivel_A = Nivel.new('A', 5)
  # @return [Nivel] level B.
  @nivel_B = Nivel.new('B', 10)
  # @return [Nivel] level C.
  @nivel_C = Nivel.new('C', 15)
  # @return [Nivel] level Ciauh.
  @nivel_Cuauh = Nivel.new('Cuauh', 20)
  # @return [Array] football teams.
  @equipos = []

  # @param [Nivel] nivel
  # finds the level class instantiation given the string param
  # @return [Nivel] the level class instantiation corresponding with the given param
  def find_nivel(nivel)
    case nivel
    when 'A'
      @nivel_A
    when 'B'
      @nivel_B
    when 'C'
      @nivel_C
    when 'Cuauh'
      @nivel_Cuauh
    else
      @nivel_A
    end
  end

  # @param [string] json a string containing a correct JSON with the players.
  # Finds the teams and players being contained in the given JSON.
  # @return [Array] equipos an array containing the teams found in the json, each team
  #   contains the corresponding players.
  def find_teams_and_players(json)
    begin
      raise ArgumentError.new 'Debes ingresar un json...' if json.empty?
    # When an integer, float, etc. is entered, te method empty will throw a NoMethodError
    rescue NoMethodError
      raise ArgumentError.new 'Debes ingresar un json...'
    end
    begin
      parsed = JSON.parse(json)
    rescue JSON::ParserError => e
      raise JSON::ParserError
    end
    jugadores_JSON = parsed['jugadores']

    unless jugadores_JSON.nil?
      jugadores_JSON.each do |jugador|
        equipo_obtenido = Equipo.new(jugador['equipo'])
        nombre_equipo = equipo_obtenido.nombre
        nivel = find_nivel(jugador['nivel'])
        jugador_obtenido = Jugador.new(jugador['nombre'], jugador['goles'], jugador['sueldo'], jugador['bono'], equipo_obtenido, nivel)

        equipo = @equipos.find { |equipo| equipo.nombre == nombre_equipo }

        # Si el equipo ya esta en el array: se agrega el jugador al equipo | se sustituye el equipo
        # del array con el mas reciente
        if equipo
          equipo.add_player(jugador_obtenido)
          @equipos[@equipos.index(equipo)] = equipo
        # Si no esta en el array: al equipo obtenido del JSON se le agrega el jugador | se agrega
        # el equipo al array
        else
          equipo_obtenido.add_player(jugador_obtenido)
          @equipos.push(equipo_obtenido)
        end
      end
    end
    @equipos
  end

  # @param [Array(Equipo)] equipos.
  # Gets the total payment of each player.
  # @return [Array(Equipo)] the teams array with each player's attribute 'sueldo_completo' having
  #   been calculated.
  def get_players_total_payment(equipos)
    for equipo in equipos
      for jugador in equipo.jugadores
        jugador.get_total_payment(equipo.get_team_bono_percentage)
      end
    end
  end

  # @param [Array(Equipo)] equipos.
  # Translates the given array to a corresponding JSON.
  # @return [JSON] the given array translated to a JSON.
  def get_final_json(equipos)
    jugadores_totales = []

    for equipo in equipos
      for jugador in equipo.jugadores
        jugadores_totales.append(jugador)
      end
    end

    jugadores_totales_JSON = {
      'jugadores' => jugadores_totales
    }

    jugadores_totales_JSON.to_json
  end
end
