
kevin_bacon = Node.new(
  name: 'Kevin Bacon',
  films: ['Black Mass','Telling Lies in America', 'Novocaine', 'The Big Picture','Frost/Nixon']
)

# 1st degrees have a direct connection
johnny_depp = Node.new(
  name: 'Johnny Depp',
  films: ['Black Mass','Pirates of the Caribbean: Dead Man\'s Chest']
)
tom_kemp = Node.new(
  name: 'Tom Kemp',
  films: ['Black Mass','Ghosts of Girfriends Past']
)
dakota_johnson = Node.new(
 name: 'Dakota Johnson',
 films: ['Black Mass', 'Fifty Shades of Grey']
)
luke_wilson = Node.new(
  name: 'Luke Wilson',
  films: ['The Family Stone', 'Telling Lies in America']
)
benedict_cumberbatch = Node.new(
  name: 'Benedict Cumberbatch',
  films: ['Black Mass','Doctor Strange']
)
keith_david = Node.new(
  name: 'Keith David',
  films: ['Mr. & Mrs. Smith', 'Novocaine']
)
aaron_white = Node.new(
  name: 'Aaron White',
  films: ['Repitition','Frost/Nixon']
)

# 2nd degrees can connect through 2 films, e.g. Bacon film --> at least 1 non-bacon film
keira_knightley = Node.new(
  name: 'Keira Knightley',
  films: ['Pirates of the Caribbean: Dead Man\'s Chest']
)
jennifer_garner = Node.new(
  name: 'Jennifer Garner',
  films: ['Ghosts of Girlfriends Past']
)
rachel_mcadams = Node.new(
  name: 'Rachel McAdams',
  films: ['The Family Stone', 'Doctor Strange']
)
angelina_jolie = Node.new(
  name: 'Angelina Jolie',
  films: ['Mr. & Mrs. Smith', 'Novocaine']
)
tom_hogan = Node.new(
  name: 'Tom Hogan',
  films: ['The War Within', 'The Romantic']
)
alex_albrecht = Node.new(
  name: 'Alex Albrecht',
  films: ['Repetition']
)

# 3rd degree connection: 1 bacon film --> 2 non-bacon films
elizabeth_allen = Node.new(
  name: 'Elizabeth Allen',
  films: ['The Three Weird Sisters', 'Dead Man\'s Shoes', 'The Big Picture']
)
elvis_presley = Node.new(
  name: 'Elvis Presley',
  films: ['Charro!','Son of Fury: The Story of Benjamin Blake', 'The Big Picture']
)

# 4th degree: 1 bacon film --> 3 non-bacon films
tom_rock = Node.new(
  name: 'Tom Rock',
  films: ['The War Within',' The Romantic','Repetition','Frost/Nixon']
)
