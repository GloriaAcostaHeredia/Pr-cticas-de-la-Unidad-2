/*
Ahora la empresa quiere realizar un aumento de sueldo a todos los empleados según la región en donde estén trabajando. 
Para la región de “Americas”, el aumento del sueldo será de un 5% y para la región de “Europe” de 8%. 
Este problema también ocupará un bloque de código PL/SQL anónimo en donde se usen cursores.
*/



DECLARE
    v_employee_id employees.employee_id%TYPE;
    v_region employees.region%TYPE;
    v_salary employees.salary%TYPE;
    
    CURSOR c_employee_regions IS
        SELECT employee_id, region, salary
        FROM employees;
BEGIN
    FOR employee_region IN c_employee_regions LOOP
        v_employee_id := employee_region.employee_id;
        v_region := employee_region.region;
        v_salary := employee_region.salary;
        
        IF v_region = 'Americas' THEN
            v_salary := v_salary * 1.05; 
        ELSIF v_region = 'Europe' THEN
            v_salary := v_salary * 1.08; 
        END IF;
        
        UPDATE employees
        SET salary = v_salary
        WHERE employee_id = v_employee_id;
    END LOOP;

    COMMIT; 
END;
/
