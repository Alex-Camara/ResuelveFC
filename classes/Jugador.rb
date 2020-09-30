class Jugador
    attr_accessor :nombre, :goles, :nivel, :sueldo_completo

    def initialize(nombre, goles, sueldo, bono, equipo, nivel)
        raise ArgumentError.new "El jugador debe tener un nombre..." unless nombre.is_a?(String) && !nombre.empty?
        raise ArgumentError.new "los goles deben ser números enteros..." unless goles.is_a?(Integer)
        raise ArgumentError.new "solo se permiten números en el valor sueldo..." unless sueldo.is_a?(Integer) || sueldo.is_a?(Float)
        raise ArgumentError.new "solo se permiten números en el valor bono..." unless bono.is_a?(Integer) || bono.is_a?(Float)

        @nombre = nombre
        @goles = goles
        @sueldo = sueldo
        @bono = bono
        @equipo = equipo
        @nivel = nivel unless nivel.nil?
    end

    def to_hash
        {
            nombre: @nombre,
            goles_minimos: @nivel.goles_mes,
            goles: @goles,
            sueldo: @sueldo,
            bono: @bono,
            sueldo_completo: @sueldo_completo,
            equipo: @equipo.nombre
        }
    end

    def to_json(options)
        to_hash.to_json
    end

    def nivel=(nivel)
        @nivel = nivel
    end

    def get_individual_bono_percentage
        return @goles / (@nivel.goles_mes.to_f / 100)
    end

    def get_total_payment(team_bono)
        decimal_total_bono_percentage = ((get_individual_bono_percentage + team_bono) / 2) / 100
        discounted_bono = @bono * decimal_total_bono_percentage
        @sueldo_completo = @sueldo + discounted_bono
    end
end