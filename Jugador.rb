class Jugador
    attr_accessor :nombre
    attr_accessor :goles
    attr_accessor :nivel

    def initialize(nombre, goles, sueldo, bono)
        @nombre = nombre
        @goles = goles
        @sueldo = sueldo
        @bono = bono
    end

    def nivel(nivel)
        @nivel = nivel
    end

    def get_individual_bono_percentage
        return @goles / (@nivel.goles_mes.to_f / 100)
    end

    def get_total_payment(team_bono)
        decimal_total_bono_percentage = ((get_individual_bono_percentage + team_bono) / 2) / 100
        discounted_bono = @bono * decimal_total_bono_percentage
        total_payment = @sueldo + discounted_bono
        return total_payment
    end
end