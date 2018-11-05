class Player

  attr_accessor :score, :id

  def initialize(id = rand(100000))
    @id = id
    @score = 0
  end


end
