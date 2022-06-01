set serveroutput on;
DECLARE
    p pilote%ROWTYPE;
BEGIN
    p.MATRICULE := '3';
    p.NOM := 'WACHT';
    p.VILLE := 'STRASBOURG';
    p.AGE := '47';
    p.SALAIRE := '30000';
    INSERT INTO PILOTE VALUES p;
END;
/


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