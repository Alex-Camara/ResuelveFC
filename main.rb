require_relative './classes/Jugador'
require_relative './classes/Equipo'
require_relative './classes/Nivel'
require_relative './modules/JSON_utilities'
include JSON_utilities

MENSAJE_INTRODUCCION_DATOS = "Ingresa la cadena json con los jugadores:"
MENSAJE_RESPUESTA = "Respuesta: "
MENSAJE_ENTRADA_NO_JSON = "La cadena ingresada no es un JSON válido..."
MENSAJE_ENTRADA_INTEGER_NO_JSON = "debes ingresar un JSON válido, no un numero..."
MENSAJE_EQUIPO_JSON_VACIO = "el json que indrodujiste no tiene nigun jugador..."

# {"jugadores":[{  "nombre":"Juan Perez","nivel":"C","goles":10,"sueldo":50000,"bono":25000,"sueldo_completo":null,"equipo":"rojo"},{  "nombre":"EL Cuauh","nivel":"Cuauh","goles":30,"sueldo":100000,"bono":30000,"sueldo_completo":null,"equipo":"azul"},{"nombre":"Cosme Fulanito","nivel":"A","goles":7,"sueldo":20000,"bono":10000,"sueldo_completo":null,"equipo":"azul"},{"nombre":"El Rulo","nivel":"B","goles":9,"sueldo":30000,"bono":15000,"sueldo_completo":null,"equipo":"rojo"}]}

repetir_input = true

begin
    puts MENSAJE_INTRODUCCION_DATOS
    input_json = gets.chomp
    begin
        equipos = JSON_utilities.find_teams_and_players(input_json)
        if equipos.length() > 0
            JSON_utilities.get_players_total_payment(equipos)
            final_JSON = JSON_utilities.get_final_json(equipos)
            puts MENSAJE_RESPUESTA
            puts final_JSON
            repetir_input = false
        else
            puts MENSAJE_EQUIPO_JSON_VACIO
        end
        #Rescatar el programa si la cadena ingresada no es un json válido
    rescue JSON::ParserError
        puts MENSAJE_ENTRADA_NO_JSON
        #Rescatar el programa si no se ingresó una cadena 
    rescue TypeError => e
        puts MENSAJE_ENTRADA_INTEGER_NO_JSON
    rescue Exception => error
        puts error
    end
end while repetir_input