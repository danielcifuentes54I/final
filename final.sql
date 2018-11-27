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

