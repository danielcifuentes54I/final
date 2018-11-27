--PARCIAL FINAL DANIEL CIFUENTES

--function divisible_sum_pairs

CREATE TYPE number_array AS VARRAY(100) OF INTEGER;
/

CREATE OR REPLACE FUNCTION divisible_sum_pairs (P_ARRAY IN number_array, k in INTEGER) RETURN INTEGER IS
contador integer := 0; 
ARRAY_NO_VALIDO EXCEPTION;
K_NO_VALIDO EXCEPTION;
BEGIN
    -- se realizan las verificaciones de los parámetros
    IF k < 1 or k >100 THEN
        RAISE K_NO_VALIDO;
    END IF;

    FOR i IN P_ARRAY.FIRST .. P_ARRAY.LAST LOOP
        IF P_ARRAY(i) < 1 OR P_ARRAY(i) >100  THEN
              RAISE ARRAY_NO_VALIDO;
        END IF;
    END LOOP;  
    
    FOR i IN P_ARRAY.FIRST .. P_ARRAY.LAST LOOP
        FOR j IN i+1 .. P_ARRAY.LAST LOOP
            IF MOD((P_ARRAY(i) + P_ARRAY(j)),k) = 0 THEN
                contador := contador +1;
                dbms_output.put_line('*('||i||','||j||') -> ar['||i||'] ar['||j||'] -> ' || TO_CHAR(P_ARRAY(i)) ||'+'|| TO_CHAR(P_ARRAY(j)) || ' = ' || TO_CHAR(P_ARRAY(i) + P_ARRAY(j)));
            END IF;
        END LOOP; 
    END LOOP;  
    
    RETURN contador;
    EXCEPTION
    --Se capturan las excepciones
    WHEN K_NO_VALIDO THEN 
       RAISE_APPLICATION_ERROR(-20000,'PARAMETRO K NO VALIDO');
    WHEN ARRAY_NO_VALIDO THEN 
       RAISE_APPLICATION_ERROR(-20001,'ARRAY NO VALIDO');
END;
/

--function find_digits
CREATE OR REPLACE FUNCTION find_digits (P_NUMBER IN INTEGER) RETURN INTEGER IS
contador integer := 0; 
v_digit integer;
K_NO_VALIDO EXCEPTION;
BEGIN
    -- se realizan las verificaciones de los parámetros
   /* IF k < 1 or k >100 THEN
        RAISE K_NO_VALIDO;
    END IF;*/
    
    FOR i IN 1 .. length(P_NUMBER)LOOP
        v_digit := substr(P_NUMBER,i,1);
        if MOD(P_NUMBER, v_digit) = 0 then
         contador:=contador+1;
        END IF;
    END LOOP;
    
    
    RETURN contador;
    EXCEPTION
    --Se capturan las excepciones
    WHEN K_NO_VALIDO THEN 
       RAISE_APPLICATION_ERROR(-20000,'PARAMETRO K NO VALIDO');
END;
/

--SE CREA LA TABLA, SE INSERTAN DATOS Y SE CONFIRMA LA TRANSACCION
create table digits (n integer, pairs integer);

INSERT INTO DIGITS (n) VALUES (111);
INSERT INTO DIGITS (n) VALUES (12);
INSERT INTO DIGITS (n) VALUES (1012);

COMMIT;

CREATE OR REPLACE CALCULATE_FIND_DIGITS 








SET SERVEROUTPUT ON;
DECLARE
    texto INTEGER:=1012;
    caracter INTEGER;
BEGIN 
    dbms_output.put_line('LA LETRA ' || find_digits(texto));
END;
/



select substr(123456,6,1) FROM DUAL;

select length(123456) FROM DUAL;

select mod (10,0) from dual;
