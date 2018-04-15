# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    @members.push(person)
  end

  def leave(person)
    if @members.include?(person)
      @members.delete(person)
    end
  end

  def front
    @members.shift
  end

  def middle
    midpoint = (@members.length/2).floor
    @members[midpoint]
  end

  def back
    @members.pop
  end

  def search(person)
    if @members.include?(person)
      return person
    else
      return nil
    end
  end

  private

  def index(person)
    @members.find_index(person)
  end

end
