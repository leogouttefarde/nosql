//Liste des entreprises et le nombre d'experts/intermédiaires qu'elles cherchent (toutes compétences incluses) se trouvant dans le même pays que l'entrepris
MATCH (cmp:Company)-[r:LOOKS_FOR_COMPETENCE]->(s:Skill)
MATCH (company_country:Country)<-[]-(cmp)
MATCH (prs:Person)-[h:HAS]->(s)
MATCH (person_country:Country)<-[]-(prs)
where h.level IN ['Intermediate', 'Expert'] AND person_country.name = company_country.name
return  cmp as company,count(prs) as coun

// Pour l'entreprise Apple, liste des personnes qui ont une connaissance qui travaille dans l’entreprise et qui partagent au moins une compétence de même niveau avec celle-ci
MATCH (c:Company {name: 'Apple'})-[WORKS_AT]-(p:Person)-[KNOWS]-(pp:Person)
OPTIONAL MATCH (s:Skill)<-[h:HAS]-(p)
OPTIONAL MATCH (ss:Skill)<-[hh:HAS]-(pp)-[WORKS_AT]-(c)
WHERE h.level = hh.level
RETURN pp as person;
// Testé fonctionnel

// Liste des entreprises qui travaillent dans l'informatique et le pétrole employant des personnes spécialisées en finance
MATCH (ss:Skill {name: 'Finance'})-[HAS]-(pp:Person)-[WORKS_AT]-(cc:Company)-[BELONGS_TO]-(ii:Industry {name: 'Software Engineering'})
OPTIONAL MATCH (cc)-[BELONGS_TO]-(jj:Industry {name: 'Oil'})
RETURN cc;
// Testé fonctionnel

// Augmenter le salaire de tous les employés experts en 'Neo4j' des entreprises d'informatique de 200%
MATCH (ss:Skill {name: 'Neo4j'})-[HAS {level: 'Expert'}]-(ee:Person:Employee)-[ww:WORKS_AT]-(cc:Company)-[BELONGS_TO]-(ii:Industry {name: 'Software Engineering'})
SET ww.salary = 3 * ww.salary;
// Testé fonctionnel

// Virer (supprimer la relation) tous les employés en finance de niveau débutant dans la totalité de leurs compétences ou n'ayant aucune compétence
MATCH (bb:Skill)-[HAS {level: 'Beginner'}]-(pp:Person)-[ww:WORKS_AT]-(cc:Company)-[BELONGS_TO]-(ii:Industry {name: 'Finance'})
OPTIONAL MATCH (pp)-[HAS]-(ss:Skill)
WITH ww, count(bb) AS bbCount, count(ss) AS ssCount
WHERE bbCount = ssCount
DELETE ww;
// Testé fonctionnel
