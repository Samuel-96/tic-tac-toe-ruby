require "./board.rb"
require "./player.rb"
class Game

  def initialize()
    @contador_turnos = 0
    @tablero = Board.new
    @jugador_humano = Jugador.new("X", @tablero)
    @jugador_cpu = Jugador.new("O", @tablero)
    @jugador_activo = @jugador_humano

  end

  def inicio
    # inicio de la partida y comienzo del flujo de juego por turnos
    puts "Bienvenido a las tres en raya"
    @tablero.show_board
    turno
  end

  def turno
    loop do
      # obtenemos el marcador del jugador activo
      puts "Turno del jugador con el marcador #{@jugador_activo.marcador}"
      puts "Selecciona una posicion donde poner #{@jugador_activo.marcador}: "
      pos = gets.chomp.to_i - 1
      until pos >= 0 && pos <= 8 do
        puts "Número erróneo. Selecciona una posicion donde poner #{@jugador_activo.marcador} [de la 1 a la 8]: "
        pos = gets.chomp.to_i - 1
      end
      # si no se recibe la marca en el tablero es porque el input esta mal, repetir hasta que este bien
      if !@tablero.recibir_marcador(pos, @jugador_activo.marcador)
        until @tablero.recibir_marcador(pos, @jugador_activo.marcador) do
          pp "La posicion #{pos+1} está ocupada o es inválida, elige otra: "
          pos = gets.chomp.to_i - 1

        end
      end
      @contador_turnos += 1
      @tablero.fin_partida("empate") if @contador_turnos >= 9
      # cambiamos de jugador
      @jugador_activo = (@jugador_activo == @jugador_humano) ? @jugador_cpu : @jugador_humano

    end

  end


end