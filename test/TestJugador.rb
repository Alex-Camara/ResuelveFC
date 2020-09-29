require 'test/unit'
require_relative '../classes/Jugador'
require_relative '../classes/Equipo'
require_relative '../classes/Nivel'

class TestJugador < Test::Unit::TestCase
    def setup
        @nivel_A = Nivel.new("A", 5)
        @nivel_B = Nivel.new("B", 10)
        @nivel_C = Nivel.new("C", 15)
        @nivel_Cuauh = Nivel.new("Cuauh", 20)
    end

    def test_initialize_formato_nombre_incorrecto
        nombre = 233
        goles = 10
        sueldo = 50000
        bono = 25000
        equipo = Equipo.new("Equipo de prueba")
        
        assert_raises ArgumentError do
            jugador = Jugador.new(nombre, goles, sueldo, bono, equipo)
        end
    end

    def test_initialize_nombre_vacio
        nombre = ""
        goles = 10
        sueldo = 50000
        bono = 25000
        equipo = Equipo.new("Equipo de prueba")
        
        assert_raises ArgumentError do
            jugador = Jugador.new(nombre, goles, sueldo, bono, equipo)
        end
    end

    def test_initialize_formato_goles_incorrecto
        nombre = "Juan Perez"
        goles = 1.3
        sueldo = 50000
        bono = 25000
        equipo = Equipo.new("Equipo de prueba")
        
        assert_raises ArgumentError do
            jugador = Jugador.new(nombre, goles, sueldo, bono, equipo)
        end
    end

    def test_initialize_campo_goles_vacio
        nombre = "Juan Perez"
        goles = ""
        sueldo = 50000
        bono = 25000
        equipo = Equipo.new("Equipo de prueba")
        
        assert_raises ArgumentError do
            jugador = Jugador.new(nombre, goles, sueldo, bono, equipo)
        end
    end

    def test_initialize_formato_sueldo_incorrecto
        nombre = "Juan Perez"
        goles = 10
        sueldo = "sueldo"
        bono = 25000
        equipo = Equipo.new("Equipo de prueba")
        
        assert_raises ArgumentError do
            jugador = Jugador.new(nombre, goles, sueldo, bono, equipo)
        end
    end

    def test_initialize_campo_sueldo_vacio
        nombre = "Juan Perez"
        goles = 10
        sueldo = ""
        bono = 25000
        equipo = Equipo.new("Equipo de prueba")
        
        assert_raises ArgumentError do
            jugador = Jugador.new(nombre, goles, sueldo, bono, equipo)
        end
    end

    def test_initialize_formato_bono_incorrecto
        nombre = "Juan Perez"
        goles = 10
        sueldo = 25000
        bono = "bono"
        equipo = Equipo.new("Equipo de prueba")
        
        assert_raises ArgumentError do
            jugador = Jugador.new(nombre, goles, sueldo, bono, equipo)
        end
    end

    def test_initialize_campo_bono_vacio
        nombre = "Juan Perez"
        goles = 10
        sueldo = 25000
        bono = ""
        equipo = Equipo.new("Equipo de prueba")
        
        assert_raises ArgumentError do
            jugador = Jugador.new(nombre, goles, sueldo, bono, equipo)
        end
    end

    def test_get_jugador_porcentaje_individual
        nombre = "Juan Perez"
        goles = 19
        sueldo = 50000
        bono = 10000
        equipo = Equipo.new("Equipo de prueba")
        jugador = Jugador.new(nombre, goles, sueldo, bono, equipo)

        jugador.nivel = @nivel_Cuauh

        assert_equal 95, jugador.get_individual_bono_percentage
    end

    def test_get_team_bono
        nombre = "Juan Perez"
        goles = 19
        sueldo = 50000
        bono = 10000
        equipo = Equipo.new("Equipo de prueba")
        jugador = Jugador.new(nombre, goles, sueldo, bono, equipo)
        bono_equipo = 96

        jugador.nivel = @nivel_Cuauh

        assert_equal 59550.0, jugador.get_total_payment(bono_equipo)
    end
end