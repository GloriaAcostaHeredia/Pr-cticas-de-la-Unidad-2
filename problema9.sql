/*
Para que la empresa pudiera realizar todos los aumentos de sueldo antes mencionados, 
tuvo que realizar recortes en el sueldo de los dos empleados que más ganan a excepción del empleado que más gana, que es el Presidente de la empresa. 
Cree un bloque de código anónimo para realizar la operación de reducir el 10% el salario de los dos empleados que más ganan después del Presidente.
*/


DECLARE
  v_max_salary NUMBER;
  v_second_max_salary NUMBER;
  v_president_salary NUMBER;
BEGIN

  SELECT MAX(salary)
    INTO v_max_salary
    FROM employees
   WHERE job_id != 'AD_PRES';

  SELECT MAX(salary)
    INTO v_second_max_salary
    FROM employees
   WHERE salary < v_max_salary
     AND job_id != 'AD_PRES';

  SELECT salary
    INTO v_president_salary
    FROM employees
   WHERE job_id = 'AD_PRES';

  UPDATE employees
     SET salary = salary * 0.9
   WHERE salary = v_second_max_salary;

  UPDATE employees
     SET salary = salary * 0.9
   WHERE salary = v_max_salary;

  COMMIT;
END;

