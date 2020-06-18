class Queen < Piece
  def initialize(player)
    @player = player
    @white_unicode = "\u2655"
    @black_unicode = "\u265B"
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
  def possible_move
  end
  def capture
  end
end