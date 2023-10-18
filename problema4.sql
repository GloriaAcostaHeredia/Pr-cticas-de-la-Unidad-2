/*
Crear function GET_CANT_JOBS qué tenga como parámetro p_employee_id, 
el cual contará en la tabla JOB_HISTORY la cantidad de registros de JOB que tiene un empleado; 
regresar este valor (cantidad de jobs del empleado).
*/


CREATE OR REPLACE FUNCTION GET_CANT_JOBS(p_employee_id NUMBER) RETURN NUMBER IS
    v_job_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_job_count
    FROM JOB_HISTORY
    WHERE EMPLOYEE_ID = p_employee_id;

    RETURN v_job_count;
END;


DECLARE
    v_employee_id NUMBER := 123; -- Reemplaza con el ID del empleado que deseas verificar
    v_job_count NUMBER;
BEGIN
    v_job_count := GET_CANT_JOBS(v_employee_id);
    DBMS_OUTPUT.PUT_LINE('Cantidad de trabajos del empleado: ' || v_job_count);
END;

SELECT GET_CANT_JOBS(123) AS CANTIDAD_DE_TRABAJOS FROM DUAL;

