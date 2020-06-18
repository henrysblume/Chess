class Player
  # attr_accessor :color
  def initialize(color)
    @color = color
    @captured_peices = []
  end
  
  def get_color
    @color
  end

end
