#Encoding.default_external
class Piece
  def initialize(player)
    @player = player
  end

  def get_unicode_from_children
    if @player.get_color == 'white'
      @white_unicode
    else
      @black_unicode
    end
  end

  def get_color
    @player.get_color
  end
end
