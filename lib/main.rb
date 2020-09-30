require_relative './classes/Jugador'
require_relative './classes/Equipo'
require_relative './classes/Nivel'
require_relative './modules/JSON_utilities'
include JSON_utilities

MENSAJE_INTRODUCCION_DATOS = 'Ingresa la cadena json con los jugadores:'.freeze
MENSAJE_RESPUESTA = 'Respuesta: '.freeze
MENSAJE_ENTRADA_NO_JSON = "La cadena ingresada no es un JSON v\xC3\xA1lido...".freeze
MENSAJE_ENTRADA_INTEGER_NO_JSON = "debes ingresar un JSON v\xC3\xA1lido, no un numero...".freeze
MENSAJE_EQUIPO_JSON_VACIO = 'el json que indrodujiste no tiene nigun jugador...'.freeze

# @return [Boolean] whether to continue or not the input asking.
repetir_input = true

loop do
  puts MENSAJE_INTRODUCCION_DATOS
  input_json = gets.chomp
  begin
    equipos = JSON_utilities.find_teams_and_players(input_json)
    if equipos.length > 0
      JSON_utilities.get_players_total_payment(equipos)
      final_JSON = JSON_utilities.get_final_json(equipos)
      puts MENSAJE_RESPUESTA
      puts final_JSON
      repetir_input = false
    else
      puts MENSAJE_EQUIPO_JSON_VACIO
    end
  # Rescatar el programa si la cadena ingresada no es un json válido
  rescue JSON::ParserError
    puts MENSAJE_ENTRADA_NO_JSON
  # Rescatar el programa si no se ingresó una cadena
  rescue TypeError => e
    puts MENSAJE_ENTRADA_INTEGER_NO_JSON
  rescue Exception => e
    puts e
  end
  break unless repetir_input
end
