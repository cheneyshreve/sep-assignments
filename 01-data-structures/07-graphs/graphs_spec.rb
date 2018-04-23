include Rspec

require_relative 'movies'

RSpec.describe Movies, type: Class do

describe "#find_kevin_bacon" do
  it "returns an array of at most 6 films connecting the actor to Kevin Bacon" do
    expect(@degrees_of_bacon.length).to be <= 6
  end

  it "returns 1st degree connections properly" do
    johnny_depp = Node.new(
      name: 'Johnny Depp',
      films: ['Black Mass','Pirates of the Caribbean: Dead Man\'s Chest']
    )
    keith_david = Node.new(
      name: 'Keith David',
      films: ['Mr. & Mrs. Smith', 'Novocaine']
    )
    aaron_white = Node.new(
      name: 'Aaron White',
      films: ['Repitition','Frost/Nixon']
    )

  end
end



end
