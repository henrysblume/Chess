class Knight < Piece
  def initialize(player)
    @player = player
    @white_unicode = "\u2658"
    @black_unicode = "\u265E"
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
  def castle
  end 
end
