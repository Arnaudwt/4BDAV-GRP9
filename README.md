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

## Exercice 2

## Exercice 3


```
DECLARE
v vol%ROWTYPE;
BEGIN
v.numvol := 'BA270';
v.heure_départ := to_date('01/06/2022 10:15', 'DD/MM/YYYY hh24:mi');
v.heure_arrivée := to_date('01/06/2022 12:15', 'DD/MM/YYYY hh24:mi');
v.ville_départ := 'Rome';
v.ville_arrivée := 'Paris';
INSERT INTO vol VALUES v;
END;
```