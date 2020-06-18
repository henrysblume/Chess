Encoding.default_external
require './gameboard.rb'
require './player.rb'
require './piece.rb'
require './king.rb'
require './queen.rb'
require './rook.rb'
require './bishop.rb'
require './knight.rb'
require './pawn.rb'

class Game
  attr_reader :GameBoard, :Player
  def initialize
    @white = Player.new("white")
    @black = Player.new("black")
    @board = GameBoard.new(@white, @black)
  end

  def play
    @board.display_board
    @board.turn_rotation
    #@board.print_column(0)
  end
end







game = Game.new
game.play()
