
MATCH (bb:Skill)-[HAS {level: 'Beginner'}]-(pp:Person)-[ww:WORKS_AT]-(cc:Company)-[BELONGS_TO]-(ii:Industry {name: 'Finance'})
OPTIONAL MATCH (pp)-[HAS]-(ss:Skill)
WITH ww, count(bb) AS bbCount, count(ss) AS ssCount
WHERE bbCount = ssCount
DELETE ww;
