require_relative '../classes/Jugador'
require_relative '../classes/Equipo'
require_relative '../classes/Nivel'
require 'json'

module JSON_utilities
    #Se instancian los niveles especificados en el problema
    @nivel_A = Nivel.new("A", 5)
    @nivel_B = Nivel.new("B", 10)
    @nivel_C = Nivel.new("C", 15)
    @nivel_Cuauh = Nivel.new("Cuauh", 20)
    @equipos = Array.new

    # @param [Nivel] nivel: 
    def find_nivel(nivel)
        case nivel
        when "A"
            return @nivel_A
        when "B"
            return @nivel_B
        when "C"
            return @nivel_C
        when "Cuauh"
            return @nivel_Cuauh
        else
            return @nivel_A
        end
    end

    def find_teams_and_players(json)
        begin
            if json.empty?
                raise ArgumentError.new "Debes ingresar un json..."
            end
        # When an integer, float, etc. is entered, te method empty will throw a NoMethodError
        rescue NoMethodError
            raise ArgumentError.new "Debes ingresar un json..."
        end
        begin
            parsed = JSON.parse(json)
        rescue JSON::ParserError => error
            raise JSON::ParserError
        end
        jugadores_JSON = parsed["jugadores"]

        if !jugadores_JSON.nil?
            for jugador in jugadores_JSON
                equipo_obtenido = Equipo.new(jugador["equipo"])
                nombre_equipo = equipo_obtenido.nombre
                nivel = find_nivel(jugador["nivel"])
                jugador_obtenido = Jugador.new(jugador["nombre"], jugador["goles"], jugador["sueldo"], jugador["bono"], equipo_obtenido, nivel)
  
                equipo = @equipos.find{|equipo| equipo.nombre == nombre_equipo}
            
                # Si el equipo ya esta en el array: se agrega el jugador al equipo | se sustituye el equipo 
                # del array con el mas reciente
                if equipo
                    equipo.add_player(jugador_obtenido)
                    @equipos[@equipos.index(equipo)] = equipo
                #Si no esta en el array: al equipo obtenido del JSON se le agrega el jugador | se agrega 
                #el equipo al array
                else
                    equipo_obtenido.add_player(jugador_obtenido)
                    @equipos.push(equipo_obtenido)
                end
            end
        end
        return @equipos
    end

    def get_players_total_payment(equipos)
        for equipo in equipos
            for jugador in equipo.jugadores
                jugador.get_total_payment(equipo.get_team_bono_percentage())
            end
        end
    end

    def get_final_json(equipos)
        jugadores_totales = Array.new

        for equipo in equipos
            for jugador in equipo.jugadores
                jugadores_totales.append(jugador)
            end
        end

        jugadores_totales_JSON = {
            "jugadores" => jugadores_totales
        } 

        return jugadores_totales_JSON.to_json
    end
end