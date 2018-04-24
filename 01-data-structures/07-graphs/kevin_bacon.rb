require_relative 'node'

class KevinBacon

  def initialize(root)
    @root = root
    @bacon = {
      bacon_name: "Kevin Bacon",
      features: ['Black Mass','Telling Lies in America','Novocaine', 'The Big Picture','Frost/Nixon'],
      collaborators: ['Johnny Depp','Tom Kemp','Dakota Johnson', 'Luke Wilson','Benedict Cumberbatch',
      'Keith David', 'Aaron White'],
      degree: 0
    }
    @degrees_of_bacon = {}
  end

  def insert(root,node)
    if @root.nil?
      @root = node
    else
      @root.next = node
    end
  end

  def find(root, actor_name)
    return nil if @root.nil? || actor_name.nil?
    actors = [@root]
    while !actors.empty?
      current = actors.shift
      if current.name = actor_name
        return current
      else
        return nil
      end
    end

  end

  def find_kevin_bacon(root,actor_name)
   # check if the value is in the bacon cache
   temp = @degrees_of_bacon[actor_name]
   if temp != nil
     return puts "#{actor_name} has a #{temp[0]} degree connection to Kevin Bacon through the film #{temp[1]}"
   else
     actor = find(root,actor_name)
     populate_hash(actor.name)
   end

  end

   def populate_hash(actor_name)
    database = {
   "Black Mass"=> ['Kevin Bacon', 'Johnny Depp', 'Tom Kemp', 'Dakota Johnson', 'Benedict Cumberbatch'],
   "Telling Lies in America": ['Kevin Bacon', 'Luke Wilson'],
   "Novocaine"=> ['Kevin Bacon','Keith David'],
   "The Big Picture"=> ['Kevin Bacon', 'Roddy McDowall'],
   "Frost/Nixon":['Kevin Bacon'],
   "The Romantic"=> ['Kevin Bacon', 'Tom Hogan'],
   "Pirates of the Caribbean: Dead Man\'s Chest" => ['Johnny Depp', 'Keira Knightley'],
   "Ghosts of Girfriends Past"=> ['Tom Kemp', 'Jennifer Garner'],
   "The Family Stone"=> ['Luke Wilson', 'Rachel McAdams'],
   "Doctor Strange"=>['Benedict Cumberbatch', 'Rachel McAdams'],
   "Mr. & Mrs. Smith"=> ['Keith David', 'Angelina Jolie'],
   "The Three Weird Sisters"=> ['Elizabeth Allen', 'Nancy Price'],
   "Dead Man\'s Shoes"=> ['Nancy Price', 'Roddy McDowall'],
   "Falling From Grace"=> ['Calude Akins', 'Aaron White'],
   "Battle for the Planet of the Apes"=> ['Claude Akins', 'Roddy McDowall'],
  }

  films = []
  # extract films the actor has been in
   database.each do |key,value|
     if value.include?(actor_name) && value.include?("Kevin Bacon")
       @degrees_of_bacon[actor_name] = [1, key]
       return puts "#{actor_name} has a 1st degree connection to " +
       "Kevin Bacon through the movie #{key}"
     end
   end

  end


end


# 1st degree examples
root = Node.new('Johnny Depp')
tom_kemp = Node.new('Tom Kemp')
dakota_johnson = Node.new('Dakota Johnson')
#2nd degree examples
keira_knightley = Node.new('Keira Knightley')

tree = KevinBacon.new(root)
tree.insert(root, tom_kemp)
tree.insert(root,dakota_johnson)
tree.insert(root, keira_knightley)
# tree.find(root, 'Keira Knightley')
# tree.find(root, "Tom Kemp")
# tree.find(root, "Dakota Johnson")
tree.find_kevin_bacon(root,"Dakota Johnson")
