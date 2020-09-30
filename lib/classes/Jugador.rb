# @author Alex Cámara
class Jugador
  # @return [String] the name of the player.
  attr_accessor :nombre
  # @return [Integer] the amount of goals made by the player.
  attr_accessor :goles
  # @return [Nivel] the level the player is in.
  attr_accessor :nivel
  # @return [Float] the player's base salary.
  attr_accessor :sueldo
  # @return [Float] the total amount to be paid to the player, it is calculated given
  #   the individual and team bonos.
  attr_accessor :sueldo_completo
  # @return [Float] the player's corresponding bono.
  attr_accessor :bono
  # @return [Equipo] the team the player is in.
  attr_accessor :equipo

  # @raise [ArgumentError] when the attribute 'nombre' is an empty string or is not a string.
  # @raise [ArgumentError] when the attribute 'goles' is not an Integer.
  # @raise [ArgumentError] when the attribute 'sueldo' is not an Integer or Float.
  # @raise [ArgumentError] when the attribute 'bono' is not an Integer or Float.
  def initialize(nombre, goles, sueldo, bono, equipo, nivel)
    raise ArgumentError, 'El jugador debe tener un nombre...' unless nombre.is_a?(String) && !nombre.empty?
    raise ArgumentError.new "los goles deben ser n\xC3\xBAmeros enteros..." unless goles.is_a?(Integer)
    unless sueldo.is_a?(Integer) || sueldo.is_a?(Float)
      raise ArgumentError.new "solo se permiten n\xC3\xBAmeros en el valor sueldo..."
    end
    unless bono.is_a?(Integer) || bono.is_a?(Float)
      raise ArgumentError.new "solo se permiten n\xC3\xBAmeros en el valor bono..."
    end

    @nombre = nombre
    @goles = goles
    @sueldo = sueldo
    @bono = bono
    @equipo = equipo
    @nivel = nivel unless nivel.nil?
  end

  def to_hash
    {
      nombre: @nombre,
      goles_minimos: @nivel.goles_mes,
      goles: @goles,
      sueldo: @sueldo,
      bono: @bono,
      sueldo_completo: @sueldo_completo,
      equipo: @equipo.nombre
    }
  end

  def to_json(_options)
    to_hash.to_json
  end

  # gets the player's bono percentage given the amount of goals achieved in relation to his level
  # and his base salary.
  # @example
  #   given the following player:
  #
  #     jugador = Jugador.new('Juan Perez', 19, 50_000, 10_000, equipo, @nivel_Cuauh)
  #
  #   the player's level minimal goals are: 20
  #   the actual player's goals are: 19
  #
  #   so the individual bono percentage would be: 95
  # @return [Float] the player's individual bono percentage.
  def get_individual_bono_percentage
    @goles / (@nivel.goles_mes.to_f / 100)
  end

  # Gets the player's total payment.
  # @param [Float] team_bono the player's team bono percentage.
  # Calculates the payment given the player's individual bonus and the player's team bonus.
  # @example
  #   given the following:
  #
  #     jugador = Jugador.new(nombre, 19, 50_000, 10_000, equipo, @nivel_Cuauh)
  #     bono_individual = 95
  #     bono_equipo = 96
  #
  #   the total bono percentage would be: 95.5
  #   applying the total percentage to the 10_000 bono: 9_550
  #   the total paymento would be: 50_000 (base salary) + 9_550 = 59_550
  # return [Float] the player's total payment.
  def get_total_payment(team_bono)
    decimal_total_bono_percentage = ((get_individual_bono_percentage + team_bono) / 2) / 100
    discounted_bono = @bono * decimal_total_bono_percentage
    @sueldo_completo = @sueldo + discounted_bono
  end
end
