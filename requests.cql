//Liste des entreprises et le nombre d'experts/intermédiaires qu'elles cherchent (toutes compétences incluses) se trouvant dans le même pays que l'entrepris
MATCH (cmp:Company)-[r:LOOKS_FOR_COMPETENCE]->(s:Skill)
MATCH (company_country:Country)<-[]-(cmp)
MATCH (prs:Person)-[h:HAS]->(s)
MATCH (person_country:Country)<-[]-(prs)
where h.level IN ['Intermediate', 'Expert'] AND person_country.name = company_country.name
return  cmp as company,count(prs) as coun

// Liste des entreprises qui travaillent dans l'informatique et le pétrole employant des personnes spécialisées en finance
MATCH (ss:Skill)-[HAS]-(pp:Person)-[WORKS_AT]-(cc:Company)-[BELONGS_TO]-(ii:Industry)
MATCH (cc)-[BELONGS_TO]-(jj:Industry)
WHERE ii.name = 'Software Engineering'   AND jj.name = 'Oil' AND ss.name='Finance'
RETURN cc;

// Augmenter le salaire de tous les employés experts en 'Neo4j' des entreprises d'informatique de 200%
MATCH (ss:Skill)-[HAS]-(pp:Person)-[ww:WORKS_AT]-(cc:Company)-[BELONGS_TO]-(ii:Industry)
WHERE ss.name='Neo4j' AND ss.level = 'Expert' AND ii.name = 'Software Engineering'
SET ww.salary = 3 * ww.salary;

// Virer (supprimer la relation) tous les employés en finance de niveau débutant dans la totalité de leurs compétences ou n'ayant aucune compétence
MATCH (bb:Skill {level: 'Beginner'})-[HAS]-(pp:Person)-[ww:WORKS_AT]-(cc:Company)-[BELONGS_TO]-(ii:Industry {name: 'Finance'})
MATCH (pp)-[HAS]-(ss:Skill)
WITH pp, count(bb) AS bbCount, count(ss) AS ssCount
WHERE bbCount = ssCount
DELETE pp;
