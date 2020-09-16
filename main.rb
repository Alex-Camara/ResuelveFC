require_relative 'Jugador'
require_relative 'Equipo'
require_relative 'Nivel'
require_relative 'JSON_extract'
require 'json'

include JSON_extract

json_string = '
    {
        "jugadores" : [  
           {  
              "nombre":"Juan Perez",
              "nivel":"C",
              "goles":10,
              "sueldo":50000,
              "bono":25000,
              "sueldo_completo":null,
              "equipo":"rojo"
           },
           {  
              "nombre":"EL Cuauh",
              "nivel":"Cuauh",
              "goles":30,
              "sueldo":100000,
              "bono":30000,
              "sueldo_completo":null,
              "equipo":"azul"
           },
           {  
              "nombre":"Cosme Fulanito",
              "nivel":"A",
              "goles":7,
              "sueldo":20000,
              "bono":10000,
              "sueldo_completo":null,
              "equipo":"azul"
     
           },
           {  
              "nombre":"El Rulo",
              "nivel":"B",
              "goles":9,
              "sueldo":30000,
              "bono":15000,
              "sueldo_completo":null,
              "equipo":"rojo"
     
           }
        ]
     }'

parsed = JSON.parse(json_string)
jugadores_JSON = parsed["jugadores"]
equipos = Array.new

for jugador in jugadores_JSON
    equipo_obtenido = Equipo.new(jugador["equipo"])
    nombre_equipo = equipo_obtenido.nombre
    jugador_obtenido = Jugador.new(jugador["nombre"], jugador["goles"], jugador["sueldo"], jugador["bono"])
    nivel = jugador["nivel"]
    jugador_obtenido.nivel(JSON_extract.find_nivel(nivel))

    equipo = equipos.find{|equipo| equipo.nombre == nombre_equipo}

    # Si el equipo ya esta en el array: se agrega el jugador al equipo | se sustituye el equipo 
    # del array con el mas reciente
    if equipo
        equipo.add_player(jugador_obtenido)
        equipos[equipos.index(equipo)] = equipo
    #Si no esta en el array: al equipo obtenido del JSON se le agrega el jugador | se agrega 
    #el equipo al array
    else
        equipo_obtenido.add_player(jugador_obtenido)
        equipos.push(equipo_obtenido)
    end
end

