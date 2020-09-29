class Equipo
    attr_accessor :nombre
    attr_accessor :jugadores 

    def initialize(nombre)
        raise ArgumentError.new "El equipo debe tener un nombre..." unless not nombre.empty?
        @nombre = nombre
        @jugadores = Array.new
    end

    def to_json
        @jugadores.map do |jugador|
            jugador.to_hash
        end.to_json
    end

    def add_player(player)
        @jugadores.push(player)
    end

    def get_team_bono_percentage
        total_goals = 0
        total_minimal_goals = 0
        for player in @jugadores
            total_goals += player.goles
            total_minimal_goals += player.nivel.goles_mes
        end
        return total_goals / (total_minimal_goals.to_f / 100)
    end
end