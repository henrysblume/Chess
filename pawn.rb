class Pawn < Piece
  # attr_accessor :color
  def initialize(player)
    @player = player
    @white_unicode = "\u2659"
    @black_unicode = "\u265F"
  end

  def player_reader
    @player
  end
  def w_unicode_reader
    @white_unicode
  end
  def b_unicode_reader
    @black_unicode
  end

#-------MOVES!--------

#   def initial_move
#     # if on row 6 or 1 move to row 4 or 3 OR 5 or 2.
#     if @board[6] & @player.color == "white"
#       piece_movement ==  @board[5] | @board[4]#check rows somehow here against piece_movement
#     elsif @board [1] & player.color == "black"
#       piece_movement == @board [3] | @board[2]
#     end
#   end
#
# #I have a manner for piecemovement before to all of these need to be checks to some exten.... do these need to be a functions or just one function that checks variables .... valid initial move is to x which I have assigend to row (3 or 4?)?
#
#   def normal_moves
#     # move forward one row unless white on row 6 or black on row 1.
#   end
#
#   def capture #already works? overwrites the piece and makes nill, just cant see it in captured_peices this way BUT can only attack diagonal
#   end
#
#   def promote
#     # if white on row 8. Prompt user and pawn becomes entered piece.new SAME for black on row 0.
#   end
#
#   def en_passant
#     #if black initial move & white next to, white can move to diagonal forward spot and delete black pawn. Same for white.
#   end
end
