class Bishop < Piece
  def initialize(player)
    @player = player
    @white_unicode = "\u2657"
    @black_unicode = "\u265D"
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

  def is_valid?(end_row, end_column, current_row, current_column, board)
    current_position = [current_row, current_column]
    user_choice = current_row == end_row && current_column == end_column #fix

    until current_row | current_column == 7 #not sure this is right
      current_position = current_row + 1 && current_column + 1 #syntax?
      if board[current_row][current_column].is_a? Piece
        piece = board[current_row][current_column]
        if piece.get_color == self.get_color
          break
        elsif piece.get_color != self.get_color && user_choice
          return true
        end
      elsif user_choice
        return true
      end
    end

    return false
  end

end
