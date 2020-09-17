require_relative 'Jugador'
require_relative 'Equipo'
require_relative 'Nivel'
require_relative 'JSON_extract'
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

equipos = JSON_extract.find_teams_and_players(json_string)

JSON_extract.get_players_total_payment(equipos)

JSON_extract.get_final_json(equipos)