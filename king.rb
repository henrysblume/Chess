class King < Piece
  def initialize(player)
    @player = player
    @white_unicode = "\u2654"
    @black_unicode = "\u265A"

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

  def is_vaid?
    
  end







  # def is_valid?
  # @w_initial_position = @board[[s_r]][[s_c]]
  # new_position = nil
  # s_r = 7
  # s_c = 4
  # valid_move = s_r + 0, s_c + 1 | s_r + 1, s_c + 1 | s_r + -1, s_c + 1 | s_r + 0, s_c + -1 | s_r + 1, s_c + -1 | s_r + -1, s_c + -1 | s_r + -1, s_c + 0 | s_r + 1, s_c + 0
  # #ehhhhhhh & new position =! piece that is  current player.color & new position is not @ob_top | @ob_bottom | @ob_left | @ob_right
  # current position =  new position
  #
  # then want to check and see if player input in gameboard is equal to any of these options and if so then good
  #
  # @move_number = 0
  # #   initial_position + 1 or 0 to all combinations and check if occupied and not move into check but worry about that later.
  # #
  # #
  # #
  # end

  # def possible_move
  # end
  # def capture
  # end
end
