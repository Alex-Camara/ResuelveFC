require_relative 'Jugador'
require_relative 'Equipo'
require_relative 'Nivel'

nivel_A = Nivel.new("A", 5)
nivel_B = Nivel.new("B", 10)
nivel_C = Nivel.new("C", 15)
nivel_Cuauh = Nivel.new("Cuauh", 20)

equipo_azul = Equipo.new("azul")
equipo_rojo = Equipo.new("rojo")

jugador_elrulo = Jugador.new("El Rulo", nivel_B, 9, 30000, 15000, equipo_rojo)
jugador_juan = Jugador.new("Juan Pérez", nivel_C, 10, 50000, 25000, equipo_rojo)

equipo_rojo.add_player(jugador_elrulo)
equipo_rojo.add_player(jugador_juan)

puts jugador_elrulo.get_total_payment