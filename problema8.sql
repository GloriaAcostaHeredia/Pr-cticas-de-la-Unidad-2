/*
La empresa se dió cuenta que aún con los aumentos dados todavía tenía empleados que no ganaban lo suficiente, 
por lo que decidió dar un aumento extra del 10% a los 5 empleados que menos ganan. Realizar el bloque anónimo de código PL/SQL para 
realizar esta operación.
*/

DECLARE
    CURSOR c_employees_lowest_salary IS
        SELECT employee_id, salary
        FROM employees
        ORDER BY salary
        FETCH FIRST 5 ROWS ONLY; 
    
    v_employee_id employees.employee_id%TYPE;
    v_salary employees.salary%TYPE;
BEGIN
    FOR employee_lowest_salary IN c_employees_lowest_salary LOOP
        v_employee_id := employee_lowest_salary.employee_id;
        v_salary := employee_lowest_salary.salary;
        
        v_salary := v_salary * 1.10; 
        
        UPDATE employees
        SET salary = v_salary
        WHERE employee_id = v_employee_id;
    END LOOP;

    COMMIT; 
END;

