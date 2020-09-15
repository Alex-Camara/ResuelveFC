class Jugador
    attr_accessor :nombre

    def initialize(nombre, goles, sueldo, bono)
        @nombre = nombre
        @goles = goles
        @sueldo = sueldo
        @bono = bono
    end
end