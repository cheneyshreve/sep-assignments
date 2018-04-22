include RSpec

require_relative 'min_heap'
RSpec.describe MinHeap, type: Class do
  let (:tree) { MinHeap.new }
  let (:root) { Node.new("Hackers", 32) }
  let (:n1) { Node.new("Cowboys & Aliens", 44) }
  let (:n2) { Node.new("Lara Croft: Tomb Raider", 49) }
  let (:n3) { Node.new("Maleficient", 50) }
  let (:n4) { Node.new("Clear and Present Danger", 82) }
  let (:n5) { Node.new("Spy", 94) }
  let (:n6) { Node.new("Austin Powers: International Man of Mystery", 70) }
  let (:n7) { Node.new("Avatar", 83) }
  let (:n8) { Node.new("Ender\'s Game", 61) }
  let (:n9) { Node.new("Salt", 62) }
  let (:n10) { Node.new("Wanted", 71) }
  let (:n11) { Node.new("Jumanji: Welcome to the Jungle", 76) }


  describe "#insert" do
    it "properly inserts a node" do
      tree.insert(n1)
      node = tree.find(root,n1)
      expect(node.title).to eq "Cowboys & Aliens"
    end
  end

  describe "#find" do
    it "finds and returns the node" do
      tree.insert(n1)
      node = tree.find(root,n1)
      expect(node.title).to eq "Cowboys & Aliens"
      expect(node.rating).to eq 44
    end
  end

  describe "#delete" do
    it "deletews a node" do
      tree.delete(root,n1)
      item = tree.find(root,n1)
      expect(item).to be_nil
    end
  end

  describe "#printf" do
    specify {
       expected_output = "Spy: 94\nAvatar: 83\nClear and Present Danger: 82\nEnder's Game: 61\nWanted: 71\nJumanji: Welcome to the Jungle: 76\nAustin Powers: International Man of Mystery: 70\nHackers: 32\nMaleficient: 50\nLara Croft: Tomb Raider: 49\nSalt: 62\nCowboys & Aliens: 44\n"
      tree.insert(root)
      tree.insert(n1)
      tree.insert(n2)
      tree.insert(n3)
      tree.insert(n4)
      tree.insert(n5)
      tree.insert(n6)
      tree.insert(n7)
      tree.insert(n8)
      tree.insert(n9)
      tree.insert(n10)
      tree.insert(n11)
      expect { tree.printf }.to output(expected_output).to_stdout
    }
  end

end
