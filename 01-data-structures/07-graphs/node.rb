class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
  attr_accessor :next

  def initialize(name)
    @name = name
    @film_actor_hash = {name: @name}
  end


end
