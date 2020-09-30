require 'test/unit'
require_relative '../classes/Jugador'
require_relative '../classes/Equipo'
require_relative '../classes/Nivel'

class Test_Equipo < Test::Unit::TestCase
    def setup
        @nivel_A = Nivel.new("A", 5)
        @nivel_B = Nivel.new("B", 10)
        @nivel_C = Nivel.new("C", 15)
        @nivel_Cuauh = Nivel.new("Cuauh", 20)
    end

    def test_initialize_formato_nombre_incorrecto
        nombre = 872

        assert_raises ArgumentError do
            equipo = Equipo.new(nombre)
        end
    end

    def test_initialize_campo_nombre_vacio
        nombre = ""

        assert_raises ArgumentError do
            equipo = Equipo.new(nombre)
        end
    end

    def test_agregar_jugador
        equipo = Equipo.new("Equipo de prueba")
        jugador1 = Jugador.new("Juan Perez", 19, 50000, 10000, equipo)
        equipo.add_player(jugador1)

        assert_equal true, equipo.jugadores.include?(jugador1)
    end

    def test_get_porcentaje_bono_equipo
        equipo = Equipo.new("Rojo")

        jugador1 = Jugador.new("Juan Perez", 10, 50000, 25000, equipo)
        jugador1.nivel = @nivel_C

        jugador2 = Jugador.new("El Rulo", 9, 30000, 15000, equipo)
        jugador2.nivel = @nivel_B

        equipo.add_player(jugador1)
        equipo.add_player(jugador2)

        assert_equal 76, equipo.get_team_bono_percentage
    end

end