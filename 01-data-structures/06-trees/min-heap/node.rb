class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :node

  def initialize(title, rating, params = {})
    @title = title
    @rating = rating
    @node = params.fetch(:title, :rating)
  end
end
