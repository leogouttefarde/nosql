
MATCH (cmp:Company)-[r:LOOKS_FOR_COMPETENCE]->(s:Skill)
MATCH (company_country:Country)<-[]-(cmp)
MATCH (prs:Person)-[h:HAS]->(s)
MATCH (person_country:Country)<-[]-(prs)
WHERE h.level IN ['Intermediate', 'Expert'] AND person_country.name = company_country.name
RETURN cmp AS Company, count(prs) AS Number;
