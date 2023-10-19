/*
Crear un stored procedure que se llame SAVE_EMPLOYEE en el cual tenga como parámetros todos los campos de la tabla EMPLOYEES y 
los tipos de datos correspondientes a esta tabla, los nombres de los parámetros van a ser los mismos que los nombres de las columnas de la tabla, 
pero con el prefijo p_ (employee_id sería p_employee_id). Todos van a ser parámetros de entrada excepto p_employee_id el cual va a ser IN OUT. 
La funcionalidad de este stored procedure será que cuando se le envíe un valor NULL o 0 en p_employee_id, se realizará la operación de INSERT 
en la tabla empoyees con los todos los datos enviados en los parámetros, y en p_employee_id se regresará el identificador del registro 
insertado según la secuencia EMPLOYEE_SEQ. Cuando se establece un valor en p_employee_id, se realizará una operación de UPDATE del registro 
con ese identificador, con todos los datos enviados como parámetros.
*/

CREATE SEQUENCE EMPLOYEE_SEQ;

CREATE OR REPLACE PROCEDURE SAVE_EMPLOYEE(
  p_employee_id IN OUT NUMBER,
  p_first_name VARCHAR2,
  p_last_name VARCHAR2,
  p_email VARCHAR2,
  p_phone_number VARCHAR2,
  p_hire_date DATE,
  p_job_id VARCHAR2,
  p_salary NUMBER,
  p_manager_id NUMBER,
  p_department_id NUMBER
)
AS
BEGIN
  -- Si p_employee_id es NULL o 0, realizar una operación de INSERT
  IF p_employee_id IS NULL OR p_employee_id = 0 THEN
    INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id)
    VALUES (EMPLOYEE_SEQ.NEXTVAL, p_first_name, p_last_name, p_email, p_phone_number, p_hire_date, p_job_id, p_salary, p_manager_id, p_department_id)
    RETURNING employee_id INTO p_employee_id;
  ELSE
    -- Realizar una operación de UPDATE
    UPDATE employees
    SET first_name = p_first_name,
        last_name = p_last_name,
        email = p_email,
        phone_number = p_phone_number,
        hire_date = p_hire_date,
        job_id = p_job_id,
        salary = p_salary,
        manager_id = p_manager_id,
        department_id = p_department_id
    WHERE employee_id = p_employee_id;
  END IF;
  COMMIT;
END;
/


DECLARE
  v_employee_id NUMBER;
BEGIN
  -- Insertar un nuevo empleado
  SAVE_EMPLOYEE(
    p_employee_id => v_employee_id,
    p_first_name => 'Gloria',
    p_last_name => 'Acosta',
    p_email => 'Gacosta@upvictoria.com',
    p_phone_number => '834-111-1111',
    p_hire_date => TO_DATE('2023-10-19', 'YYYY-MM-DD'),
    p_job_id => 'IT_PROG',
    p_salary => 50000,
    p_manager_id => 101,
    p_department_id => 60
  );

  DBMS_OUTPUT.PUT_LINE('Nuevo empleado insertado con ID: ' || v_employee_id);

  -- Actualizar un empleado existente
  SAVE_EMPLOYEE(
    p_employee_id => 101,
    p_first_name => 'Gloria',
    p_last_name => 'Acosta',
    p_email => 'G_acosta@upvictoria.com',
    p_phone_number => '834-111-1112',
    p_hire_date => TO_DATE('2022-08-15', 'YYYY-MM-DD'),
    p_job_id => 'HR_REP',
    p_salary => 55000,
    p_manager_id => 101,
    p_department_id => 60
  );

  DBMS_OUTPUT.PUT_LINE('Empleado actualizado con ID: 105');
END;
/
