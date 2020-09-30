require 'test/unit'
require_relative '../lib/classes/Jugador'
require_relative '../lib/classes/Equipo'
require_relative '../lib/classes/Nivel'
require_relative '../lib/modules/JSON_utilities'
include JSON_utilities

class Test_JSON_utilities < Test::Unit::TestCase
  def setup
    @nivel_A = Nivel.new('A', 5)
    @nivel_B = Nivel.new('B', 10)
    @nivel_C = Nivel.new('C', 15)
    @nivel_Cuauh = Nivel.new('Cuauh', 20)
  end

  def test_find_teams_and_players_with_empty_json
    json = {}
    assert_raises ArgumentError do
      JSON_utilities.find_teams_and_players(json)
    end
  end

  def test_find_teams_and_players_with_wrong_json
    json = 344
    assert_raises ArgumentError do
      JSON_utilities.find_teams_and_players(json)
    end
  end

  def test_find_teams_and_players_with_numbers_instead_of_json
    json = 344
    assert_raises ArgumentError do
      JSON_utilities.find_teams_and_players(json)
    end
  end

  def test_find_teams_and_players_with_empty_string_instead_of_json
    json = ''
    assert_raises ArgumentError do
      JSON_utilities.find_teams_and_players(json)
    end
  end

  def test_find_teams_and_players_with_string_instead_of_json
    json = 'json'
    assert_raises JSON::ParserError do
      JSON_utilities.find_teams_and_players(json)
    end
  end

  def test_find_teams_and_players
    equipos = []
    equipo_rojo = Equipo.new('rojo')
    equipo_azul = Equipo.new('azul')
    jugador1 = Jugador.new('Juan Perez', 10, 50_000, 25_000, equipo_rojo, @nivel_C)
    jugador2 = Jugador.new('EL Cuauh', 30, 100_000, 30_000, equipo_azul, @nivel_Cuauh)
    jugador3 = Jugador.new('Cosme Fulanito', 7, 20_000, 10_000, equipo_azul, @nivel_A)
    jugador4 = Jugador.new('El Rulo', 9, 30_000, 15_000, equipo_rojo, @nivel_B)
    equipo_rojo.add_players([jugador1, jugador4])
    equipo_azul.add_players([jugador2, jugador3])
    equipos.push(equipo_rojo, equipo_azul)

    json = '{"jugadores":[
      {"nombre":"Juan Perez","nivel":"C","goles":10,"sueldo":50000,"bono":25000,"sueldo_completo":null,"equipo":"rojo"},
      {  "nombre":"EL Cuauh","nivel":"Cuauh","goles":30,"sueldo":100000,"bono":30000,"sueldo_completo":null,"equipo":"azul"},
      {"nombre":"Cosme Fulanito","nivel":"A","goles":7,"sueldo":20000,"bono":10000,"sueldo_completo":null,"equipo":"azul"},
      {"nombre":"El Rulo","nivel":"B","goles":9,"sueldo":30000,"bono":15000,"sueldo_completo":null,"equipo":"rojo"}]}'

    equipos_obtenidos = JSON_utilities.find_teams_and_players(json)

    assert_block do
      equipos[0].jugadores[0].nombre == equipos_obtenidos[0].jugadores[0].nombre
      equipos[0].jugadores[1].nombre == equipos_obtenidos[0].jugadores[1].nombre
    end
  end
end
