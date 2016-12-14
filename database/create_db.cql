
MATCH (n)
OPTIONAL MATCH (n)-[r]-()
DELETE n,r;

DROP CONSTRAINT ON (nn:Person) ASSERT nn.name IS UNIQUE;
DROP CONSTRAINT ON (nn:Country) ASSERT nn.name IS UNIQUE;
DROP CONSTRAINT ON (nn:Company) ASSERT nn.name IS UNIQUE;
DROP CONSTRAINT ON (nn:Skill) ASSERT nn.name IS UNIQUE;
DROP CONSTRAINT ON (nn:Industry) ASSERT nn.name IS UNIQUE;

DROP INDEX ON :Person(name);
DROP INDEX ON :Person(born);
DROP INDEX ON :Country(name);
DROP INDEX ON :Company(name);
DROP INDEX ON :Skill(name);
DROP INDEX ON :Industry(name);


CREATE CONSTRAINT ON (pp:Person) ASSERT pp.name IS UNIQUE;
CREATE CONSTRAINT ON (cc:Country) ASSERT cc.name IS UNIQUE;
CREATE CONSTRAINT ON (cc:Company) ASSERT cc.name IS UNIQUE;
CREATE CONSTRAINT ON (ss:Skill) ASSERT ss.name IS UNIQUE;
CREATE CONSTRAINT ON (ii:Industry) ASSERT ii.name IS UNIQUE;

CREATE INDEX ON :Person(name);
CREATE INDEX ON :Person(born);
CREATE INDEX ON :Country(name);
CREATE INDEX ON :Company(name);
CREATE INDEX ON :Skill(name);
CREATE INDEX ON :Industry(name);



CREATE (p1:Person:Employee)
SET p1.name = 'Alexis', p1.born = '1990-04-23 10:31:58';

CREATE (p2:Person:Employee)
SET p2.name = 'Lily', p2.born = '1994-04-23 10:31:58';

CREATE (p3:Person:Employee)
SET p3.name = 'Maxime', p3.born = '1980-05-02 11:02:59';

CREATE (p4:Person)
SET p4.name = 'Hugo', p4.born = '1994-04-23 10:31:58';

CREATE (p5:Person:Employee)
SET p5.name = 'Emma', p5.born = '1994-10-07 02:22:44';


CREATE (s1:Skill)
SET s1.name = 'Finance';

CREATE (s2:Skill)
SET s2.name = 'Neo4j';

CREATE (s3:Skill)
SET s3.name = 'Math';

CREATE (s4:Skill)
SET s4.name = 'C++';

CREATE (s5:Skill)
SET s5.name = 'Java';


CREATE (c1:Company)
SET c1.name = 'SAP SE';

CREATE (c2:Company)
SET c2.name = 'Google';

CREATE (c3:Company)
SET c3.name = 'Apple';

CREATE (c4:Company)
SET c4.name = 'Trump';

CREATE (c5:Company)
SET c5.name = 'Microsoft';


CREATE (i1:Industry)
SET i1.name = 'Finance';

CREATE (i2:Industry)
SET i2.name = 'Software Engineering';

CREATE (i3:Industry)
SET i3.name = 'Farming';

CREATE (i4:Industry)
SET i4.name = 'Chocolate';

CREATE (i5:Industry)
SET i5.name = 'Oil';


CREATE (l1:Country)
SET l1.name = 'France';

CREATE (l2:Country)
SET l2.name = 'USA';

CREATE (l3:Country)
SET l3.name = 'Germany';

CREATE (l4:Country)
SET l4.name = 'Africa';

CREATE (l5:Country)
SET l5.name = 'China';

CREATE (l6:Country)
SET l6.name = 'Russia';

CREATE (l7:Country)
SET l7.name = 'Christmas Island';



MATCH (n1:Person {name: 'Lily'}), (n2:Person { name: 'Hugo'})
CREATE (n1)-[r1:KNOWS]->(n2)
SET r1.affinity = 'Friends';

MATCH (n3:Person {name: 'Emma'}), (n4:Person { name: 'Lily'})
CREATE (n3)-[r2:KNOWS]->(n4)
SET r2.affinity = 'Friends';

MATCH (n5:Person {name: 'Hugo'}), (n6:Person { name: 'Emma'})
CREATE (n5)-[r3:KNOWS]->(n6)
SET r3.affinity = 'Friends';

MATCH (p1:Person {name: 'Maxime'}), (p2:Person { name: 'Hugo'})
CREATE (p1)-[rr:KNOWS]->(p2)
SET rr.affinity = 'Friends';

MATCH (p1:Person {name: 'Alexis'}), (p2:Person { name: 'Lily'})
CREATE (p1)-[rr:KNOWS]->(p2)
SET rr.affinity = 'Acquaintances';


MATCH (n1:Person {name: 'Lily'}), (n2:Skill { name: 'Finance'})
CREATE (n1)-[rr:HAS]->(n2)
SET rr.level = 'Expert';

MATCH (n1:Person {name: 'Maxime'}), (n2:Skill { name: 'Finance'})
CREATE (n1)-[rr:HAS]->(n2)
SET rr.level = 'Beginner';

MATCH (n1:Person {name: 'Alexis'}), (n2:Skill { name: 'Finance'})
CREATE (n1)-[rr:HAS]->(n2)
SET rr.level = 'Beginner';

MATCH (n1:Person {name: 'Lily'}), (n2:Skill { name: 'Neo4j'})
CREATE (n1)-[rr:HAS]->(n2)
SET rr.level = 'Expert';

MATCH (n1:Person {name: 'Alexis'}), (n2:Skill { name: 'Neo4j'})
CREATE (n1)-[rr:HAS]->(n2)
SET rr.level = 'Expert';

MATCH (n1:Person {name: 'Maxime'}), (n2:Skill { name: 'Neo4j'})
CREATE (n1)-[rr:HAS]->(n2)
SET rr.level = 'Intermediate';


MATCH (n1:Person {name: 'Alexis'}), (n2:Company { name: 'Apple'})
CREATE (n1)-[rr:WORKS_AT]->(n2)
SET rr.salary = 70000, rr.startDate = '2014-04-01 09:00:00';

MATCH (n1:Person {name: 'Lily'}), (n2:Company { name: 'Apple'})
CREATE (n1)-[rr:WORKS_AT]->(n2)
SET rr.salary = 72000, rr.startDate = '2012-07-14 09:00:00';

MATCH (n1:Person {name: 'Maxime'}), (n2:Company { name: 'Microsoft'})
CREATE (n1)-[rr:WORKS_AT]->(n2)
SET rr.salary = 72000, rr.startDate = '2012-07-14 09:00:00';

MATCH (n1:Person {name: 'Hugo'}), (n2:Company { name: 'Microsoft'})
CREATE (n1)-[rr:WORKS_AT]->(n2)
SET rr.salary = 60000;

MATCH (n1:Person {name: 'Emma'}), (n2:Company { name: 'SAP SE'})
CREATE (n1)-[rr:WORKS_AT]->(n2)
SET rr.salary = 65000;


MATCH (n1:Company {name: 'Apple'}), (n2:Skill { name: 'Finance'})
CREATE (n1)-[rr:LOOKS_FOR_COMPETENCE]->(n2);

MATCH (n1:Company {name: 'Microsoft'}), (n2:Skill { name: 'Finance'})
CREATE (n1)-[rr:LOOKS_FOR_COMPETENCE]->(n2);

MATCH (n1:Company {name: 'Trump'}), (n2:Skill { name: 'Finance'})
CREATE (n1)-[rr:LOOKS_FOR_COMPETENCE]->(n2);


MATCH (n1:Company {name: 'Trump'}), (n2:Country { name: 'USA'})
CREATE (n1)-[rr:LOCATED_IN]->(n2);

MATCH (n1:Company {name: 'Apple'}), (n2:Country { name: 'USA'})
CREATE (n1)-[rr:LOCATED_IN]->(n2);

MATCH (n1:Company {name: 'Microsoft'}), (n2:Country { name: 'USA'})
CREATE (n1)-[rr:LOCATED_IN]->(n2);

MATCH (n1:Company {name: 'Apple'}), (n2:Country { name: 'France'})
CREATE (n1)-[rr:LOCATED_IN]->(n2);

MATCH (n1:Company {name: 'Microsoft'}), (n2:Country { name: 'France'})
CREATE (n1)-[rr:LOCATED_IN]->(n2);


MATCH (n1:Person {name: 'Lily'}), (n2:Country { name: 'USA'})
CREATE (n1)-[rr:LIVES_IN]->(n2);

MATCH (n1:Person {name: 'Emma'}), (n2:Country { name: 'USA'})
CREATE (n1)-[rr:LIVES_IN]->(n2);

MATCH (n1:Person {name: 'Alexis'}), (n2:Country { name: 'USA'})
CREATE (n1)-[rr:LIVES_IN]->(n2);

MATCH (n1:Person {name: 'Hugo'}), (n2:Country { name: 'France'})
CREATE (n1)-[rr:LIVES_IN]->(n2);

MATCH (n1:Person {name: 'Maxime'}), (n2:Country { name: 'France'})
CREATE (n1)-[rr:LIVES_IN]->(n2);


MATCH (n1:Company {name: 'Apple'}), (n2:Industry { name: 'Finance'})
CREATE (n1)-[rr:BELONGS_TO]->(n2);

MATCH (n1:Company {name: 'Microsoft'}), (n2:Industry { name: 'Finance'})
CREATE (n1)-[rr:BELONGS_TO]->(n2);

MATCH (n1:Company {name: 'Apple'}), (n2:Industry { name: 'Oil'})
CREATE (n1)-[rr:BELONGS_TO]->(n2);

MATCH (n1:Company {name: 'Microsoft'}), (n2:Industry { name: 'Oil'})
CREATE (n1)-[rr:BELONGS_TO]->(n2);

MATCH (n1:Company {name: 'Apple'}), (n2:Industry { name: 'Software Engineering'})
CREATE (n1)-[rr:BELONGS_TO]->(n2);

MATCH (n1:Company {name: 'Microsoft'}), (n2:Industry { name: 'Software Engineering'})
CREATE (n1)-[rr:BELONGS_TO]->(n2);

MATCH (n1:Company {name: 'SAP SE'}), (n2:Industry { name: 'Software Engineering'})
CREATE (n1)-[rr:BELONGS_TO]->(n2);

MATCH (n1:Company {name: 'Apple'}), (n2:Industry { name: 'Finance'})
CREATE (n1)-[rr:BELONGS_TO]->(n2);




