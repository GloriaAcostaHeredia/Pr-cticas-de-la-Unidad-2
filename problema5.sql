/*
Crear stored procedure CALC_PAYROLL en el cuál va a tener los parámetros p_taxes OUT NUMBER(18, 3) y p_to_pay OUT NUMBER(18, 3). 
En p_taxes se va a regresar el valor correspondiente a la sumatoria de todos los impuestos que 
hay que pagar por cada empleado (según la tabla del problema 02), y en p_to_pay se regresa la sumatoria de todo lo que hay que pagar a 
los empleados descontando el impuesto de cada uno.
*/


CREATE OR REPLACE PROCEDURE CALC_PAYROLL(
    p_taxes OUT NUMBER,
    p_to_pay OUT NUMBER) AS
    v_total_taxes NUMBER := 0;
    v_total_to_pay NUMBER := 0;
BEGIN
    FOR emp IN (SELECT EMPLOYEE_ID, SALARY FROM EMPLOYEES)
    LOOP
        v_total_taxes := v_total_taxes + (emp.SALARY * GET_TAXES_OF_SALARY(emp.SALARY));
        v_total_to_pay := v_total_to_pay + (emp.SALARY - (emp.SALARY * GET_TAXES_OF_SALARY(emp.SALARY)));
    END LOOP;

    p_taxes := v_total_taxes;
    p_to_pay := v_total_to_pay;
END;


DECLARE
    v_taxes NUMBER;
    v_to_pay NUMBER;
BEGIN
    CALC_PAYROLL(v_taxes, v_to_pay);
    
    -- Mostrar los resultados
    DBMS_OUTPUT.PUT_LINE('Total de impuestos a pagar: ' || v_taxes);
    DBMS_OUTPUT.PUT_LINE('Total a pagar a empleados: ' || v_to_pay);
END;

