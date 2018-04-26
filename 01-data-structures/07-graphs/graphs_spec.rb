include RSpec
require_relative 'node'
require_relative 'kevin_bacon'

RSpec.describe KevinBacon, type: Class do

let(:root) { Node.new('Johnny Depp') }
let(:tom_kemp) { Node.new('Tom Kemp') }
let(:dakota_johnson) { Node.new('Dakota Johnson') }
let(:keira_knightley) { keira_knightley = Node.new('Keira Knightley') }
let(:elizabeth_allen) { Node.new('Elizabeth Allen') }
let(:tree) { KevinBacon.new(root) }

before do
  tree.insert(root, tom_kemp)
  tree.insert(root,dakota_johnson)
  tree.insert(root, keira_knightley)
  tree.insert(root, elizabeth_allen)
end

describe "#insert" do
 it "inserts a new actor node" do
   node = tree.find(root, "Tom Kemp")
   expect(node.name).to eq "Tom Kemp"
 end
end

describe "#find" do
 it "returns actor node" do
   node = tree.find(root, "Keira Knightley")
   expect(node.name).to eq "Keira Knightley"
 end
end

describe "#find_kevin_bacon for himself" do
   specify {
    expected_output = "Kevin Bacon has a 0 degree connection to himself."
    expect { expect { tree.find_kevin_bacon(root,"Kevin Bacon") }.to output(expected_output).to_stdout}
   }
end

describe "#find_kevin_bacon for 1st degree connection" do
   specify {
    expected_output = "Dakota Johnson is connected to Kevin Bacon through [Black Mass]."
    expect { expect { tree.find_kevin_bacon(root,"Dakota Johnson") }.to output(expected_output).to_stdout}
   }
end

describe "#find_kevin_bacon for 2nd degree connection" do
   specify {
    expected_output = "Keira Knightley is connected to Kevin Bacon through [\"\Black Mass", "Pirates of the Caribbean: Dead Man's Chest\"\]."
    expect { expect { tree.find_kevin_bacon(root,"Keira Knightley") }.to output(expected_output).to_stdout}
   }
end

describe "#find_kevin_bacon for a 3rd degree connection" do
  specify {
   expected_output = "Elizabeth Allen is connected to Kevin Bacon through [\"\"The Big Picture","Dead Man's Shoes", "The Three Weird Sisters\"\]"
   expect { expect { tree.find_kevin_bacon(root,"Elizabeth Allen") }.to output(expected_output).to_stdout}
  }
end

end
