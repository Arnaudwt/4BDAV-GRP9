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

