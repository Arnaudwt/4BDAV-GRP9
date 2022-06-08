# 4BDAV

## Exercice 1
```
CREATE TABLE CLI(
NumCli NUMBER GENERATED BY DEFAULT AS IDENTITY,
NomCli VARCHAR2(50) NOT NULL,
Pays VARCHAR2(50) NOT NULL,
Ville VARCHAR2(50) NOT NULL,
Dept VARCHAR2(50) NOT NULL,
PRIMARY KEY(NumCli)
);
```

### 2.

```
CREATE TABLE COM(
    NumCom NUMBER GENERATED BY DEFAULT AS IDENTITY,
    NumCli VARCHAR2(50) NOT NULL,
    Qte VARCHAR2(50) NOT NULL,
    Remise VARCHAR2(50) NOT NULL,
    PRIMARY KEY(NumCom);
);


CREATE TABLE DET(
    NumCom NUMBER GENERATED BY DEFAULT AS IDENTITY,
    NumCli VARCHAR2(50) NOT NULL,
    FraisPort VARCHAR2(50) NOT NULL,
    AnCom VARCHAR2(50) NOT NULL,
    Payement VARCHAR2(50) NOT NULL,
    FOREIGN KEY (NumPro) REFERENCES PRO (NumPro);
    FOREIGN KEY (NumCom) REFERENCES COM (NumCom);
);




CREATE TABLE PRO(
    NumPro NUMBER GENERATED BY DEFAULT AS IDENTITY,
    NumFou VARCHAR2(50) NOT NULL,
    NomPro VARCHAR2(50) NOT NULL,
    TypePro VARCHAR2(50) NOT NULL,
    PrixUnit VARCHAR2(50) NOT NULL,
    PRIMARY KEY(NumPro),
    FOREIGN KEY (NumFou) REFERENCES FOU (NumFou);
);



CREATE TABLE FOU(
    NumFou NUMBER GENERATED BY DEFAULT AS IDENTITY,
    NomFou VARCHAR2(50) NOT NULL,
    Pays VARCHAR2(50) NOT NULL,
    Tel VARCHAR2(50) NOT NULL,
    PRIMARY KEY(NumFou)
);

```



### 3.
Oui, il y a un ordre à respecter dans la création, si on crée des clés qui se réfèrent à des choses inexistantes, ça ne va pas marcher.
Par exemple, nous allons commencer par créer la table FOU car d'autres tables comme PRO nécessite qu'elle soit déja existante

### 4.

### 5.
La commande est Drop Table ou Delete Table, il faut aussi faire attention à l'ordre pour les mêmes raisons ci-dessus

## Exercice 2

### 4. On retrouve 6 Tables : Countries, Departments, Employees,Job_History, Jobs, Locations, Regions

## Exercice 3

### 1.
```
SELECT EMPLOYEES.FIRST_NAME || ' ' || EMPLOYEES.LAST_NAME, EMPLOYEES.commission_pct, DEPARTMENTS.DEPARTMENT_NAME, EMPLOYEES.hire_date
from EMPLOYEES
INNER JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
WHERE commission_pct != 0 AND SALARY >= 10000 AND SALARY <= 15000 AND employees.hire_date <= '11/06/2005'
```

### 2.
```
SELECT ROUND(AVG(SALARY),2), MAX(SALARY), MIN(SALARY), MEDIAN(SALARY), DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES
INNER JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
GROUP BY departments.department_name
```

### 3.
```
SELECT JOB_TITLE, MAX_SALARY
FROM JOBS
WHERE rownum <= 10
ORDER BY MAX_SALARY DESC
```
### 4.

```
SELECT EMPLOYEES.FIRST_NAME || ' ' || EMPLOYEES.LAST_NAME, SALARY
from EMPLOYEES
INNER JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
WHERE DEPARTMENT_NAME = 'IT' AND SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES)
```

### 5.

```
SELECT e.FIRST_NAME || ' ' || e.LAST_NAME, HIRE_DATE
from EMPLOYEES e
WHERE HIRE_DATE < (SELECT HIRE_DATE from EMPLOYEES WHERE e.MANAGER_ID = EMPLOYEE_ID)
```

# DAY 2

## Exercice 1
```
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

```
## Exercice 2

```
SELECT table_name,num_rows FROM all_tables WHERE owner = 'HR';
```

## Exercice 3

```

CREATE TABLE Vol(
    IdVol VARCHAR(255) NOT NULL,
    Date_heure_depart DATE NOT NULL,
    Date_heure_arrivee DATE NOT NULL,
    Ville_depart VARCHAR(255),
    Ville_arrivee VARCHAR(255)
);

set serveroutput on;
DECLARE
    v vol%ROWTYPE;
BEGIN
    v.IDVOL := 'BA270';
    v.Date_heure_depart := to_date('01/06/2022 10:15', 'DD/MM/YYYY hh24:mi');
    v.Date_heure_arrivee := to_date('01/06/2022 12:15', 'DD/MM/YYYY hh24:mi');
    v.Ville_depart := 'Rome';
    v.Ville_arrivee := 'Paris';
    INSERT INTO VOL VALUES v;
END;
/
```

## Exercice 4

```

CREATE TABLE PILOTE(
    Matricule INT PRIMARY KEY NOT NULL,
    Nom VARCHAR(255) NOT NULL,
    Ville VARCHAR(255) NOT NULL,
    Age INT NOT NULL,
    Salaire INT NOT NULL
);

DECLARE
CURSOR curseur1 IS SELECT salaire FROM pilote
WHERE (Age >= 45 AND Age <=55);
salairePilote Pilote.Salaire%TYPE;
sommeSalaires NUMBER(11,2) := 0;
moyenneSalaires NUMBER(11,2);
BEGIN
OPEN curseur1;
LOOP
FETCH curseur1 INTO salairePilote;
EXIT WHEN (curseur1%NOTFOUND OR curseur1%NOTFOUND IS NULL);
sommeSalaires := sommeSalaires + salairePilote;
END LOOP;
moyenneSalaires := sommeSalaires / curseur1%ROWCOUNT;
CLOSE curseur1;
DBMS_OUTPUT.PUT_LINE('Moyenne salaires : ' ||
moyenneSalaires);
END;

```

# DAY 3

## Exercice 1

### Hadoop



### Hive

### Hbase