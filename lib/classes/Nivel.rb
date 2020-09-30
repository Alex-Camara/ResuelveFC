# @author Alex Cámara
class Nivel
  # @return [String] the name of the level.
  attr_accessor :nombre
  # @return [Integer] the level's required number of goals at a month.
  attr_accessor :goles_mes

  def initialize(nombre, goles_mes)
    @nombre = nombre
    @goles_mes = goles_mes
  end
end
