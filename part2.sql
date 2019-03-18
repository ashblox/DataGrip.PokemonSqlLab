# Question: What are all the types of pokemon that a pokemon can have?
# Answer: Normal, Water, Grass, Rock, Fire, Ground, Poison, Bug, Electric, Dragon, Steel, Dark, Fighting, Psychic, Ghost, Fairy, Ice, Flying
SELECT GROUP_CONCAT(' ', name)
FROM types;

# Question: What is the name of the pokemon with id 45?
# Answer: Eevee
SELECT name
FROM pokemons
WHERE id = 45;

# Question: How many pokemon are there?
# Answer: 656
SELECT COUNT(1)
FROM pokemons;

# Question: How many types are there?
# Answer: 18
SELECT COUNT(1)
FROM types;

# Question: How many pokemon have a secondary type?
# Answer: 316
SELECT COUNT(secondary_type)
FROM pokemons;
