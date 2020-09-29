require 'test/unit'
require_relative '../classes/Jugador'
require_relative '../classes/Equipo'

class TestJugador < Test::Unit::TestCase

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

    def test_jugador_porcentaje_individual
        nombre = "Juan Perez"
        goles = 10
        sueldo = 25000
        bono = ""
        equipo = Equipo.new("Equipo de prueba")
    end

end