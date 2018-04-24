require_relative 'node'




class KevinBacon

  def initialize(root)
    @root = root
    @bacon = {
      "bacon_name"=> "Kevin Bacon",
      "collaborators"=> ['Johnny Depp','Tom Kemp','Dakota Johnson',
      'Luke Wilson','Benedict Cumberbatch','Keith David',
      'Aaron White','Roddy McDowall','Tom Hogan'],
      "degree"=> 0
    }

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
    return nil if root.nil? || actor_name.nil?
     actor = find(root,actor_name)
     return nil if actor.nil?
     populate_hash(actor.name)
  end

  def populate_hash(actor_name)
    database = {
   "Black Mass"=> ['Kevin Bacon', 'Johnny Depp', 'Tom Kemp', 'Dakota Johnson', 'Benedict Cumberbatch'],
   "Telling Lies in America"=> ['Kevin Bacon', 'Luke Wilson'],
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

  # check for 1st degree connections
   database.each do |key,value|
     if actor_name == "Kevin Bacon"
       return "Kevin Bacon has a 0 degree connection to himself."
     end
     if value.include?(actor_name) && value.include?("Kevin Bacon")
        return puts "#{actor_name} has a 1st degree connection to " +
       "Kevin Bacon through [#{key}]."
     end
   end

  # otherwise, find the linking films (e.g. one's that don't include Bacon)
  all_films = database.keys
  linking_films = []

  all_films.each do |film|
    if !database[film].include?("Kevin Bacon")
     linking_films << film
    end
  end

  # extract the target actor's films and coactors they've acted with
  linking_actors = []
  film_target = []
  linking_films.each do |film|
    if database[film].include?(actor_name)
      film_target << film
      linking_actors << database[film]
    end
  end
  # flatten the array, then exclude the person in question because we are looking
  # now for connections through the the person's co-actors
   collabs = linking_actors.flatten
   target_collabs = []
   collabs.each do |x|
     if x != actor_name
       target_collabs << x
     end
   end

   # look for films where that the collaborator was in with a bacon collaborator
   bacon_coactors = @bacon["collaborators"]
   links = []
   match_found = false
   i = 0
   unless i = target_collabs.length || match_found = true
     bacon_coactors.each do |coactor|
       linking_films.each do |film|
         if database[film].include?(coactor) && database[film].include?(target_collabs[i])
           links << film
           match_found = true
           i += 1
         end
       end
     end

     all = (links + film_target).uniq
   end

     if all.nil?
       return "Sorry, no Bacon found"
     else
      return puts "#{actor_name} is connected through Kevin Bacon through #{all}"
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
# 3rd degree examples
elizabeth_allen = Node.new('Elizabeth Allen')


tree = KevinBacon.new(root)
tree.insert(root, tom_kemp)
tree.insert(root,dakota_johnson)
tree.insert(root, keira_knightley)
# tree.find(root, 'Keira Knightley')
# tree.find(root, "Tom Kemp")
# tree.find(root, "Dakota Johnson")
tree.find_kevin_bacon(root,"Dakota Johnson")
tree.find_kevin_bacon(root,"Keira Knightley")
tree.find_kevin_bacon(root,"Elizabeth Allen")
