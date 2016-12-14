
MATCH (ss:Skill {name: 'Finance'})-[HAS]-(ee:Person:Employee)-[WORKS_AT]-(cc:Company)-[BELONGS_TO]-(ii:Industry {name: 'Software Engineering'})
OPTIONAL MATCH (cc)-[BELONGS_TO]-(jj:Industry {name: 'Oil'})
RETURN cc AS Company;
