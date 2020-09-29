class Nivel
    attr_accessor :nombre
    attr_accessor :goles_mes

    def initialize(nombre, goles_mes)
        @nombre = nombre
        @goles_mes = goles_mes
    end
end