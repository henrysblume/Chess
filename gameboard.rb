Encoding.default_external
class GameBoard
  attr_reader :black_pawn_1, :black_pawn_2, :black_pawn_3, :black_pawn_4, :black_pawn_5, :black_pawn_6, :black_pawn_7, :black_pawn_8, :black_rook_q, :black_rook_k, :black_bishop_q, :black_bishop_k, :black_knight_q, :black_knight_k, :black_king, :black_queen, :white_pawn_1, :white_pawn_2, :white_pawn_3, :white_pawn_4, :white_pawn_5, :white_pawn_6, :white_pawn_7, :white_pawn_8, :white_rook_q, :white_rook_k, :white_bishop_k, :white_bishop_q, :white_knight_k, :white_knight_q, :white_king, :white_queen, :white_square, :black_square, :black, :white

  def initialize(white, black)
    @white = white
    @black = black

    @black_pawn_1 = Pawn.new(black)
    @black_pawn_2 = Pawn.new(black)
    @black_pawn_3 = Pawn.new(black)
    @black_pawn_4 = Pawn.new(black)
    @black_pawn_5 = Pawn.new(black)
    @black_pawn_6 = Pawn.new(black)
    @black_pawn_7 = Pawn.new(black)
    @black_pawn_8 = Pawn.new(black)
    @black_rook_q = Rook.new(black)
    @black_rook_k = Rook.new(black)
    @black_bishop_q = Bishop.new(black)
    @black_bishop_k = Bishop.new(black)
    @black_knight_q = Knight.new(black)
    @black_knight_k = Knight.new(black)
    @black_queen = Queen.new(black)
    @black_king = King.new(black)

    @white_pawn_1 = Pawn.new(white)
    @white_pawn_2 = Pawn.new(white)
    @white_pawn_3 = Pawn.new(white)
    @white_pawn_4 = Pawn.new(white)
    @white_pawn_5 = Pawn.new(white)
    @white_pawn_6 = Pawn.new(white)
    @white_pawn_7 = Pawn.new(white)
    @white_pawn_8 = Pawn.new(white)
    @white_rook_q = Rook.new(white)
    @white_rook_k = Rook.new(white)
    @white_bishop_q = Bishop.new(white)
    @white_bishop_k = Bishop.new(white)
    @white_knight_q = Knight.new(white)
    @white_knight_k = Knight.new(white)
    @white_queen = Queen.new(white)
    @white_king = King.new(white)

    @board = [
      [@black_rook_q, @black_knight_q, @black_bishop_q, @black_queen, @black_king, @black_bishop_k, @black_knight_k, @black_rook_k],
      [@black_pawn_1, @black_pawn_2, @black_pawn_3, @black_pawn_4, @black_pawn_5, @black_pawn_6, @black_pawn_7, @black_pawn_8],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, @white_bishop_q, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [@white_pawn_1, @white_pawn_2, @white_pawn_3, @white_pawn_4, @white_pawn_5, @white_pawn_6, @white_pawn_7, @white_pawn_8],
      [@white_rook_q, @white_knight_q, nil, @white_queen, @white_king, @white_bishop_k, @white_knight_k, @white_rook_k],
    ]

    @move = 0

  end

  #!!!!!!!!!! METHODS BEGIN !!!!!!!!!!!!!

  def get_board
    @board
  end

  def display_board
    @board.each_with_index do |row, index|
      row.each_with_index do |piece, sub_index|
        if piece.is_a? Piece
          print piece.get_unicode_from_children
        else
          if index.odd? & sub_index.odd?
            print "\u25A0"
          elsif index.even? & sub_index.even?
            print "\u25A0"
          else
            print "\u25A1"
          end
        end

      end
      puts "\n"

    end
  end

  # def print_column(column)
  #   print @board.transpose[column]
  # end

  def piece_movement(start_coordinates, piece)
      puts "Enter where you would like to move the piece."
      end_choice = gets.chomp.upcase
      end_coordinates = convert_coordinates(end_choice)
      is_move_valid = piece.is_valid?(end_coordinates[0],end_coordinates[1], start_coordinates[0], start_coordinates[1], @board)
      if is_move_valid
        @board[end_coordinates[0]][end_coordinates[1]] = @board[start_coordinates[0]][start_coordinates[1]]
        @board[start_coordinates[0]][start_coordinates[1]] = nil
        display_board()
      else
        puts "Invalid selection!"
        if @move.even?
          w_piece_selection()
        else
          b_piece_selection()
        end
      end
  end

  def w_piece_selection
    puts "which peice would you like to select?... e.g. A1"
    choice = gets.chomp.upcase
    coordinates = convert_coordinates(choice) #update to return something makes more sense
    chosen_piece = @board[coordinates[0]][coordinates[1]]
    if chosen_piece.is_a? Piece
      piece_movement(coordinates, chosen_piece)
    else
      puts "Invalid selection!"
      w_piece_selection()
    end
  end

  def b_piece_selection
    puts "which peice would you like to select?"
    choice = gets.chomp.upcase
    coordinates = convert_coordinates(choice)
    chosen_piece = @board[coordinates[0]][coordinates[1]]
    if chosen_piece.is_a? Piece
      piece_movement(coordinates, chosen_piece)
    else
      puts "Invalid selection!"
      b_piece_selection()
    end
  end

  def turn_rotation
    if @move == 0
      w_piece_selection()
      @move +=1
      turn_rotation()
    elsif @move.even?
      b_piece_selection()
      @move +=1
      turn_rotation()
    elsif @move.odd?
      w_piece_selection()
      @move +=1
      turn_rotation()
    #elsif checkmate()
    #other end condition rules
    end
  end

  def convert_coordinates(string) # how to refactor in order to make easier to read and to give possibility to acces enitre row easier?
    case string
      when "A8"
        [0, 0]
      when "B8"
        [0, 1]
      when "C8"
        [0, 2]
      when "D8"
        [0, 3]
      when "E8"
        [0, 4]
      when "F8"
        [0, 5]
      when "G8"
        [0, 6]
      when "H8"
        [0, 7]
      when "A7"
        [1, 0]
      when "B7"
        [1, 1]
      when "C7"
        [1, 2]
      when "D7"
        [1, 3]
      when "E7"
        [1, 4]
      when "F7"
        [1, 5]
      when "G7"
        [1, 6]
      when "H7"
        [1, 7]
      when "A6"
        [2, 0]
      when "B6"
        [2, 1]
      when "C6"
        [2, 2]
      when "D6"
        [2, 3]
      when "E6"
        [2, 4]
      when "F6"
        [2, 5]
      when "G6"
        [2, 6]
      when "H6"
        [2, 7]
      when "A5"
        [3, 0]
      when "B5"
        [3, 1]
      when "C5"
        [3, 2]
      when "D5"
        [3, 3]
      when "E5"
        [3, 4]
      when "F5"
        [3, 5]
      when "G5"
        [3, 6]
      when "H5"
        [3, 7]
      when "A4"
        [4, 0]
      when "B4"
        [4, 1]
      when "C4"
        [4, 2]
      when "D4"
        [4, 3]
      when "E4"
        [4, 4]
      when "F4"
        [4, 5]
      when "G4"
        [4, 6]
      when "H4"
        [4, 7]
      when "A3"
        [5, 0]
      when "B3"
        [5, 1]
      when "C3"
        [5, 2]
      when "D3"
        [5, 3]
      when "E3"
        [5, 4]
      when "F3"
        [5, 5]
      when "G3"
        [5, 6]
      when "H3"
        [5, 7]
      when "A2"
        [6, 0]
      when "B2"
        [6, 1]
      when "C2"
        [6, 2]
      when "D2"
        [6, 3]
      when "E2"
        [6, 4]
      when "F2"
        [6, 5]
      when "G2"
        [6, 6]
      when "H2"
        [6, 7]
      when "A1"
        [7, 0]
      when "B1"
        [7, 1]
      when "C1"
        [7, 2]
      when "D1"
        [7, 3]
      when "E1"
        [7, 4]
      when "F1"
        [7, 5]
      when "G1"
        [7, 6]
      when "H1"
        [7, 7]
      end
    end


#------- END CONDITIONS --------
# King cannot move without being in check
# if white and black make the same move three times -- Draw
# if only two kings are left -- Draw


end
