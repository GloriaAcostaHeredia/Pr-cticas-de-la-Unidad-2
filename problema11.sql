/*
Crear un bloque de código anónimo en PL/SQL en el cual se realicen las siguientes operaciones: invocar el stored procedure SAVE_EMPLOYEE 
para una prueba de operación de insert, especificando todos los parámetros necesarios; 
después invocar este mismo stored procedure pero para modificar un registros (cuando se especifica un valor en el parámetro p_employee_id.
*/

DECLARE
  v_employee_id_insert NUMBER;
  v_employee_id_update NUMBER;
BEGIN
  -- Operación de inserción
  SAVE_EMPLOYEE(
    p_employee_id => v_employee_id_insert,
    p_first_name => 'Nuevo',
    p_last_name => 'Empleado',
    p_email => 'nuevoempleado@example.com',
    p_phone_number => '123-456-7890',
    p_hire_date => TO_DATE('2023-10-19', 'YYYY-MM-DD'),
    p_job_id => 'IT_PROG',
    p_salary => 50000,
    p_manager_id => 101,
    p_department_id => 60
  );

  DBMS_OUTPUT.PUT_LINE('Nuevo empleado insertado con ID: ' || v_employee_id_insert);

  SAVE_EMPLOYEE(
    p_employee_id => v_employee_id_insert, -- ID del empleado insertado
    p_first_name => 'Empleado',
    p_last_name => 'Actualizado',
    p_email => 'actualizado@example.com',
    p_phone_number => '987-654-3210',
    p_hire_date => TO_DATE('2022-08-15', 'YYYY-MM-DD'),
    p_job_id => 'HR_REP',
    p_salary => 55000,
    p_manager_id => 102,
    p_department_id => 50
  );

  DBMS_OUTPUT.PUT_LINE('Empleado actualizado con ID: ' || v_employee_id_insert);
END;
/
