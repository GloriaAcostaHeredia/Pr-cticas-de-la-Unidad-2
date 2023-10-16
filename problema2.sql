

CREATE OR REPLACE FUNCTION GET_TAXES_OF_SALARY(p_salary NUMBER) RETURN NUMBER IS
    v_percentage NUMBER(4, 2);
BEGIN
    IF p_salary < 5000 THEN
        v_percentage := 0.08; -- 8%
    ELSIF p_salary >= 5000 AND p_salary < 7500 THEN
        v_percentage := 0.10; -- 10%
    ELSIF p_salary >= 7500 AND p_salary < 10000 THEN
        v_percentage := 0.13; -- 13%
    ELSIF p_salary >= 10000 AND p_salary < 15000 THEN
        v_percentage := 0.16; -- 16%
    ELSIF p_salary >= 15000 AND p_salary < 20000 THEN
        v_percentage := 0.19; -- 19%
    ELSIF p_salary >= 20000 AND p_salary < 50000 THEN
        v_percentage := 0.25; -- 25%
    ELSE
        v_percentage := 0.30; -- 30%
    END IF;

    RETURN v_percentage;
END;

SELECT GET_TAXES_OF_SALARY(8000) AS PORCENTAJE_DE_IMPUESTOS FROM DUAL;


DECLARE
    v_salary NUMBER(8, 2) := 8000;
    v_tax_percentage NUMBER(4, 2);
BEGIN
    v_tax_percentage := GET_TAXES_OF_SALARY(v_salary);
    DBMS_OUTPUT.PUT_LINE('El porcentaje de impuestos a pagar es: ' || v_tax_percentage);
END;


SELECT GET_TAXES_OF_SALARY(8000) AS PORCENTAJE_DE_IMPUESTOS FROM DUAL;

