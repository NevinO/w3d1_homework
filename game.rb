class Game
  attr_accessor :player1, :player2
  attr_reader :moves

  WINNING_LINES = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]

  def initialize
    @moves = []
  end 


  def result
    case
    when drawn_game?
      "It is a draw!"
    when winning_game?
      "#{moves.last.player} won!"
    else
      "Game's still in progress."
    end
  end

  def whose_turn
    return player1 if moves.empty?
    moves.last.player == player1 ? player2 : player1
  end

  def make_move(player, square)
    @moves << Move.new(square, symbol_for_player(player), player) 
  if legal_move?(square)
        @moves << move
      else
      puts "Ah, ah, ah! None of that. Try again."
       continue_from_error
  end

  def legal_move?(square)
      square < 9 && square > -1
    end

    def continue_from_error
      gets.chomp
    end

  def board
    empty_board.tap do |board|
      moves.each do |move|
        board[move.square] = move.symbol
      end
    end
  end

  def empty_board
    Array.new(9,nil)
  end

  private
  def winning_game?
    !!WINNING_LINES.detect do |winning_line|
      %w(XXX OOO).include?(winning_line.map { |e| board[e] }.join)
    end
  end

  private
  def drawn_game?
    moves.size == 9
  end



  private
  def symbol_for_player(player)
    case player
    when player1
      'X'
    when player2
      'O'
    else
      raise "Yo, that ain't right, mate"
    end
  end
end
