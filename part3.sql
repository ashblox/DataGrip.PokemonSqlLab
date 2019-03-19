# Question: What is each pokemon's primary type?
# Answer: Omitted for brevity
SELECT p.name, t.name
FROM pokemons p
JOIN types t
ON p.primary_type = t.id;

# Question: What is Rufflet's secondary type?
# Answer: Flying
SELECT t.name
FROM pokemons p
JOIN types t
ON p.secondary_type = t.id
WHERE p.name = 'Rufflet';

# Question: What are the names of the pokemon that belong to the trainer with trainerID 303?
# Answer: Wailord & Vileplume
SELECT p.name
FROM pokemon_trainer pt
JOIN pokemons p
ON pt.pokemon_id = p.id
WHERE pt.trainerID = 303;

# Question: How many pokemon have a secondary type Poison
# Answer: 31
SELECT COUNT(1)
FROM pokemons p
JOIN types t
ON p.secondary_type = t.id
WHERE t.name = 'Poison';

# Question: What are all the primary types and how many pokemon have that type?
# Answer: Omitted for brevity
SELECT t.name, COUNT(1)
FROM pokemons p
JOIN types t
ON p.primary_type = t.id
GROUP BY t.name;

# Question: How many pokemon at level 100 does each trainer with at least one level 100 pokemone have?
# Answer: Omitted for brevity
SELECT trainerID, COUNT(1)
FROM pokemon_trainer
WHERE pokelevel = 100
GROUP BY trainerID;

# Question: How many pokemon only belong to one trainer and no other?
# Answer: 13
SELECT COUNT(pokemon_id)
FROM (
    SELECT pokemon_id
    FROM pokemon_trainer
    GROUP BY pokemon_id
    HAVING COUNT(*) = 1
) AS ONE_OCCURRENCE
