--Utilizando uma query, obtenha todos os usuários (users) que vivem na cidade (cities) cujo nome seja “Rio de Janeiro”.
SELECT users.id, users.name, cities.name AS city FROM users JOIN cities ON users."cityId" = cities.id WHERE cities.name = 'Rio de Janeiro';

--Utilizando uma query, obtenha todos os depoimentos (testimonials) cadastrados, incluindo o nome do remetente e do destinatário.
SELECT testimonials.id, writer.name AS writer, recipient.name AS recipient, testimonials.message FROM testimonials JOIN users writer ON testimonials."writerId" = writer.id JOIN users recipient ON testimonials."recipientId" = recipient.id;

--Utilizando uma query, obtenha todos os cursos (courses) que o usuário com id 30 já finalizou, incluindo o nome da escola.
SELECT courses.id AS id, users.name as name, courses.name AS course, schools.name AS school, educations."endDate" FROM educations JOIN users ON educations."userId" = users.id JOIN courses ON educations."courseId" = courses.id JOIN schools ON educations."schoolId" = schools.id WHERE educations."userId" = 30 AND educations.status = 'finished';

--Utilizando uma query, obtenha as empresas (companies) para as quais o usuário com id 50 trabalha atualmente.
SELECT experiences."companyId" AS id, users.name AS name, roles.name AS role, companies.name AS company, experiences."startDate" FROM experiences JOIN users ON experiences."userId" = users.id JOIN roles ON experiences."roleId" = roles.id JOIN companies ON experiences."companyId" = companies.id WHERE experiences."endDate" IS NULL AND experiences."userId" = 50;

--Utilizando uma query, obtenha a lista das diferentes escolas (schools) e cursos (courses) onde estudaram as pessoas que estão aplicando pra posição de “Software Engineer” na empresa com id 10.
SELECT schools.id AS id, schools.name AS school, courses.name AS course, companies.name AS company, roles.name AS role FROM applicants JOIN jobs ON applicants."jobId" = jobs.id JOIN roles ON jobs."roleId" = roles.id JOIN companies ON jobs."companyId" = companies.id JOIN educations ON applicants."userId" = educations."userId" JOIN schools ON educations."schoolId" = schools.id JOIN courses ON educations."courseId" = courses.id WHERE jobs."companyId" = 10 AND roles.name = 'Software Engineer' AND jobs.active = true;
