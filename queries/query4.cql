
MATCH (ss:Skill {name: 'Neo4j'})-[HAS {level: 'Expert'}]-(ee:Person:Employee)-[ww:WORKS_AT]-(cc:Company)-[BELONGS_TO]-(ii:Industry {name: 'Software Engineering'})
SET ww.salary = 3 * ww.salary;
