class Board
  attr_reader :board

  def initialize
    @board = []
    9.times {board.push(" ")}
  end

  def show_board
    puts "----------------------"
    puts "[ #{board[0]} | #{board[1]} | #{board[2]} ] \n"
    puts "[ #{board[3]} | #{board[4]} | #{board[5]} ] \n"
    puts "[ #{board[6]} | #{board[7]} | #{board[8]} ] \n"
    puts "----------------------"
  end

  def recibir_marcador(pos, marcador)
    # si la casilla no esta ocupada devolvemos false porque no se ha efectuado la marca, si no realizamos el proceso de colocar marca, comprobar combinaciones
    # y devolvemos true porque se ha colocado una marca
    esta_ocupado?(pos) ? false : (@board[pos] = marcador; fin_partida(marcador) if combinaciones_fila(marcador) || combinaciones_columna(marcador) || combinaciones_diagonal(marcador); sleep(1); show_board; true)
  end

  def esta_ocupado?(pos)
    @board[pos] != " "
  end

  def combinaciones_fila(mark)
    @board[0..2].all? {|marcador| marcador == mark} || @board[3..5].all? {|marcador| marcador == mark} || @board[6..8].all? {|marcador| marcador == mark}
  end

  def combinaciones_columna(mark)
    @board.values_at(0, 3, 6).all? {|marcador| marcador == mark} ||
    @board.values_at(1, 4, 7).all? {|marcador| marcador == mark} ||
    @board.values_at(2, 5, 8).all? {|marcador| marcador == mark}
  end

  def combinaciones_diagonal(mark)
    @board.values_at(0, 4, 8).all? {|marcador| marcador == mark} ||
    @board.values_at(2, 4, 6).all? {|marcador| marcador == mark}
  end

  def fin_partida(marcador)
    marcador == "empate" ? (puts "¡EMPATE!") : (puts "Fin de partida, ha ganado el jugador del marcador #{marcador}")
    show_board
    sleep(2)
    exit
  end
end