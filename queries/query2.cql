
MATCH (c:Company {name: 'Apple'})-[WORKS_AT]-(e:Employee)-[KNOWS]-(ee:Employee)
MATCH (s:Skill)<-[h:HAS]-(e)
OPTIONAL MATCH (ss:Skill)<-[hh:HAS]-(ee)-[WORKS_AT]-(c)
WHERE h.level = hh.level
RETURN ee AS employee;
