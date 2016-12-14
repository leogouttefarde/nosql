
MATCH (c:Company {name: 'Apple'})-[WORKS_AT]-(p:Person)-[KNOWS]-(pp:Person)
OPTIONAL MATCH (s:Skill)<-[h:HAS]-(p)
OPTIONAL MATCH (ss:Skill)<-[hh:HAS]-(pp)-[WORKS_AT]-(c)
WHERE h.level = hh.level
RETURN pp as person;
