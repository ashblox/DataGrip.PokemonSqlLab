# Part 4: Final Report
# Explanation: Since pokelevel directly influences the fields HP, max HP, attack, defense, etc., 
    # I thought the best way to order the trainers would be take an average of the totals of these fields
    # for each of their pokemon. The "best" trainer will have pokemon with the highest average in these fields.

SELECT GROUP_CONCAT(p.name) as "Pokemon", GROUP_CONCAT(tr.trainername) as "Trainer", 
       GROUP_CONCAT(pt.pokelevel) as "PokeLevels", GROUP_CONCAT(t.name) as "Primary Types", 
       GROUP_CONCAT(r.name) as "Secondary Types"
FROM pokemon_trainer pt
JOIN (
         SELECT trainerID, AVG(hp + maxhp + attack + defense + spatk + spdef + speed) as total
         FROM pokemon_trainer
         GROUP BY trainerID
) AS AVG_POINTS ON AVG_POINTS.trainerID = pt.trainerID
JOIN pokemons p ON p.id = pt.pokemon_id
JOIN trainers tr ON tr.trainerID = pt.trainerID
JOIN types t ON t.id = p.primary_type
JOIN types r ON r.id = p.secondary_type
GROUP BY AVG_POINTS.total
ORDER BY AVG_POINTS.total DESC;
