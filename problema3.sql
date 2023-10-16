/*
Crear function SALARY_AFTER_TAXES para calcular el salario del empleado después de impuestos, esto es descontando el impuesto. 
Esta función va a tener como parámetro p_salary NUMBER(8, 2) y regresar el salario descontando el porcentaje de impuestos, según la tabla anterior
*/


CREATE OR REPLACE FUNCTION SALARY_AFTER_TAXES(p_salary NUMBER) RETURN NUMBER IS
    v_tax_percentage NUMBER(4, 2);
    v_net_salary NUMBER(8, 2);
BEGIN
    v_tax_percentage := GET_TAXES_OF_SALARY(p_salary); -- Obtener el porcentaje de impuestos
    v_net_salary := p_salary - (p_salary * v_tax_percentage); -- Calcular el salario después de impuestos

    RETURN v_net_salary;
END;



SELECT SALARY_AFTER_TAXES(8000) AS SALARIO_DESPUES_DE_IMPUESTOS FROM DUAL;
