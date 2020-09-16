require_relative 'Nivel'

module JSON_extract
    @nivel_A = Nivel.new("A", 5)
    @nivel_B = Nivel.new("B", 10)
    @nivel_C = Nivel.new("C", 15)
    @nivel_Cuauh = Nivel.new("Cuauh", 20)

    def find_nivel(nivel)
        case nivel
        when "A"
            return nivel_A
        when "B"
            return nivel_B
        when "C"
            return nivel_C
        when "Cuauh"
            return nivel_Cuauh
        else
            return nivel_A
        end
    end
end