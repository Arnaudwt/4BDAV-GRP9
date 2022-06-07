set serveroutput on;

DECLARE
nbcountries INTEGER; -- nb total de pays
nbdepartments INTEGER; --nb total departement
nbemployees INTEGER; --nb total employees
nbjobhistory INTEGER; --nb total job history
nbjobs INTEGER; -- nb total de jobs
nblocations INTEGER;
nbregions INTEGER;
nbmanager INTEGER; --nombre de manager
propmanager INTEGER; -- proportion de manager

BEGIN

SELECT COUNT(*) INTO nbcountries FROM countries;
SELECT COUNT(*) INTO nbdepartments FROM departments;
SELECT COUNT(*) INTO nbemployees FROM employees;
SELECT COUNT(*) INTO nbjobhistory FROM job_history;
SELECT COUNT(*) INTO nbjobs FROM jobs;
SELECT COUNT(*) INTO nblocations FROM locations;
SELECT COUNT(*) INTO nbregions FROM regions;

DBMS_OUTPUT.PUT_LINE('nbcountries : '||nbcountries||' nbdepartments : '||nbdepartments||' nbemployees : '||nbemployees||' nbjobhistory : '||nbjobhistory||' nbjobs : '||nbjobs||' nblocations : '||nblocations||' nbregions : '||nbregions);


SELECT COUNT(*) INTO nbmanager
FROM EMPLOYEES e
WHERE e.JOB_ID LIKE 'ST_MAN' OR e.JOB_ID LIKE 'SA_MAN' OR e.JOB_ID LIKE 'FI_MGR' OR e.JOB_ID LIKE 'AC_MGR' OR e.JOB_ID LIKE 'PU_MAN' OR e.JOB_ID LIKE 'MK_MAN';
propmanager := 100 * nbmanager / nbemployees;



DBMS_OUTPUT.PUT_LINE('nombre de managers = '||nbmanager);
DBMS_OUTPUT.PUT_LINE('proportion de managers = '||propmanager||'%');



END;