class Jugador
  attr_accessor :marcador

  def initialize(marcador, tablero)
    @marcador = marcador
    @tablero = tablero
  end
end