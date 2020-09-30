# ResuelveFC

## Description

Ruby program which receives a json input containing a set of football players and given
a set of fields, calculates the total payment they must receive. This is done by taking into
account the following:
* The player's base salary 
* The player's bonus
* The total goals made by the player in contrast with the goals required by the player's level
* The player's team performance

The process performed by the program is detailed next:

1. First, the program ask the user for a JSON input string compliant with the fomart given below.

{"jugadores": [
    {"nombre": String,
     "nivel": String,
     "goles": Integer Number,
     "sueldo": Number,
     "bono": Number,
     "sueldo_completo": Nil,
     "equipo": String}
]}

2. Afterwards, the program takes the input and converts it to a valid JSON, once that's done it proceeds to extract the football teams with the corresponding players from the JSON. **Note**: *If the input is not a valid JSON or the JSON is empty, the program will repeat the request until a valid JSON is provided.*
3. The program then calculates the team bonus percentage given the following: 

| Nivel        | Goles/Mes        
| ------------- |:-------------:| 
| A     | 5 |
| B      | 10      |
| C | 15      |
| Cuauh | 20      |

| Jugador        | Nivel | Goles anotados/ Goles requeridos        
| ------------- |:-------------:| 
| Juan     | A | 6/5 |
| Pedro      | B | 7/10 | 
| Martín | C  | 16/15 |
| Luis | Cuauh | 19/20 |
||||
| **Total** |  | 48/50 |

Each player has a level which dictates the minimal goals required by him in a month, the team bonus is
determined given the total goals actually made by the players and the total goals required by each
player's level. In this case, the team bonus is the percentage obtained of the relation 48/50, which is
96.

4. Next, the program gets each player's individual bonus. This is done by getting the percentage of 
the relation between the goals made by the player and the goals required given its level. 

| Nivel        | Goles/Mes        
| ------------- |:-------------:| 
| Cuauh     | 20 |

| Jugador        | Nivel | Goles anotados/ Goles requeridos        
| ------------- |:-------------:| 
| Luis     | Cuauh | 19/20 |

In the above example, Luis has made 19 goals but his level required him to make 20, so Luis individual bonus percentage is 95.

5. The program then gets the percentages mean and applies it to the player's bonus. 

Luis has a bonus of 10_000
The percentage mean is of 95.5
the 95.5 of 10_000 is 9_550

6. Now the program gets the total amount taking the base salary and adding up the calculated bonus. 

Luis has a base salary of 50_000
Luis has a calculated bonus of 9_550
Luis total salary is of 59_550

7. Once the program has got all the player's total payments, it converts the resulting array in a JSON and displays it to the user. 

## Usage

* [Ruby](https://www.ruby-lang.org/en/).  Written with version [2.7.0](https://www.ruby-lang.org/en/news/2019/12/25/ruby-2-7-0-released/) - *[docs](https://docs.ruby-lang.org/en/2.7.0/)*.

Install deps: `gem install bundler && bundle install`.  

Run `bundle exec rake test` to run the tests, or `bundle exec rake run` to run the program.