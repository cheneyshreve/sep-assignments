
include RSpec

require_relative 'binary_search_tree'
RSpec.describe BinarySearchTree, type: Class do
  let (:root) { Node.new("Hackers", 32) }

  let (:tree) { BinarySearchTree.new(root) }
  let (:lara_croft) { Node.new("Lara Croft: Tomb Raider", 49) }
  let (:maleficient) { Node.new("Maleficient", 50) }
  let (:clear_and_present_danger) { Node.new("Clear and Present Danger", 82) }
  let (:cowboys_and_aliens) { Node.new("Cowboys & Aliens", 44) }
  let (:spy) { Node.new("Spy", 94) }
  let (:austin_powers) { Node.new("Austin Powers: International Man of Mystery", 70) }
  let (:avatar) { Node.new("Avatar", 83) }
  let (:enders_game) { Node.new("Ender\'s Game", 61) }
  let (:salt) { Node.new("Salt", 62) }
  let (:wanted) { Node.new("Wanted", 71) }
  let (:jumanji) { Node.new("Jumanji: Welcome to the Jungle", 76) }

  describe "#printf" do
    specify {
       expected_output = "Hackers: 32\nCowboys & Aliens: 44\nLara Croft: Tomb Raider: 49\nMaleficient: 50\nClear and Present Danger: 82\nAustin Powers: International Man of Mystery: 70\nSpy: 94\nEnder's Game: 61\nWanted: 71\nAvatar: 83\nSalt: 62\nJumanji: Welcome to the Jungle: 76\n"
      tree.insert(root, cowboys_and_aliens)
      tree.insert(root, lara_croft)
      tree.insert(root, maleficient)
      tree.insert(root, clear_and_present_danger)
      tree.insert(root, spy)
      tree.insert(root, austin_powers)
      tree.insert(root, avatar)
      tree.insert(root, enders_game)
      tree.insert(root, salt)
      tree.insert(root, wanted)
      tree.insert(root,jumanji)
      expect { tree.printf }.to output(expected_output).to_stdout
    }
  end

end
