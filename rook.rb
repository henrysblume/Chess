class Rook < Piece
  def initialize(player)
    @player = player
    @white_unicode = "\u2656"
    @black_unicode = "\u265C"
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
    for column in current_column+1..7 do
      user_choice = current_row == end_row && column == end_column
      if board[current_row][column].is_a? Piece
        piece = board[current_row][column]
        if piece.get_color == self.get_color
          break
        elsif piece.get_color != self.get_color && user_choice
          return true
        end
      elsif user_choice
        return true
      end
    end

    for column in 0..current_column do
      user_choice = current_row == end_row && column == end_column
      if board[current_row][column].is_a? Piece
          piece = board[current_row][column]
          if piece.get_color == self.get_color
            break
          elsif piece.get_color != self.get_color && user_choice
            return true
          end
      elsif user_choice
        return true
      end
    end

    for row in current_row+1..7 do
      user_choice = row == end_row && current_column == end_column
      if board[row][current_column].is_a? Piece
        piece = board[row][current_column]
        if piece.get_color == self.get_color
          break
        elsif piece.get_color != self.get_color && user_choice
          return true
        end
      elsif user_choice
        return true
      end
    end

    for row in 0..current_row do
      user_choice = row == end_row && current_column == end_column
      if board[row][current_column].is_a? Piece
        piece = board[row][current_column]
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

  #cant currently castle
end
