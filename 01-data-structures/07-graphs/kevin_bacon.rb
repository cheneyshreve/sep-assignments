require_relative 'node'

class KevinBacon

  def initialize(root)
    @root = root
  end

# inserts a new actor node
  def insert(root,node)
    if @root.nil?
      @root = node
    else
      @root.next = node
    end
  end

# finds actor node in root given valid actor name
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

# calls helper method to calculate degrees of bacon from database
  def find_kevin_bacon(root,actor_name)
    return nil if root.nil? || actor_name.nil?
     actor = find(root,actor_name)
     return nil if actor.nil?
     populate_hash(actor.name)
  end

# looks for self and first degree relationships to bacon. If none found, examines
# films 1st degree actors have been in to see if they match target. If no match found,
# examines films target's co-actors have been in to see if there is a match between that actor
# and Kevin Bacon. Returns array of movies connecting actor to Bacon or response message
# if no connections are found and all possibilities are exhausted.
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

    bacon_films = []
    # check for 1st degree connections, stash films that Bacon is in for later use
     database.each do |key,value|
       if value.include?("Kevin Bacon")
         bacon_films << key
       end
       if actor_name == "Kevin Bacon"
         return "Kevin Bacon has a 0 degree connection to himself."
       end
       if value.include?(actor_name) && value.include?("Kevin Bacon")
          return puts "#{actor_name} is connected to Kevin Bacon " +
         "through [#{key}]."
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
    # exclude the person in question because we are looking for connections through the the person's co-actors
     collabs = linking_actors.flatten
     target_collabs = []
     collabs.each do |x|
        if x != actor_name
         target_collabs << x
        end
      end

       # look for films where that the collaborator was in with a bacon collaborator
      bacon_coactors = []
      bacon_films.each do |film|
        if database[film]
          bacon_coactors << database[film]
        end
      end

      bacon_coactors = bacon_coactors.flatten.uniq

      links = []
      match_found = false
      i = 0
      # until a connection is found or collaborators are exhausted, examine potential links
       until i > target_collabs.length || match_found == true
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
         return "Sorry, no Bacon found." if all.nil?
         # limit return array to at most 6 films
         if all.length > 6
           all.slice!(0,6)
         end
         puts "#{actor_name} is connected to Kevin Bacon through #{all}"
       end
  end

end
