/*
La empresa quiere realizar un aumento de sueldo a todos los empleados.Este aumento dependerá del país en donde se encuentre trabajando.
Si el empleado está trabajando en CA (Canadá), se le aumentará un 20% su sueldo; en US (United States of America) se le aumentará un 25%, 
en UK (United Kingdom) un 28%; en otras locaciones no se aumentará el salario. 
Para esto cree un bloque de código anónimo de PL/SQL para realizar la operación. Nota: Aquí se usan cursores.
*/

DECLARE
    v_employee_id NUMBER;
    v_country_id VARCHAR2(2);
    v_salary NUMBER;
    
    CURSOR c_employee_countries IS
        SELECT employee_id, country_id, salary
        FROM employees;
BEGIN
    FOR employee_country IN c_employee_countries LOOP
        v_employee_id := employee_country.employee_id;
        v_country_id := employee_country.country_id;
        v_salary := employee_country.salary;
        
        -- Calcula el aumento de sueldo según el país
        IF v_country_id = 'CA' THEN
            v_salary := v_salary * 1.20; -- Aumento del 20% en Canadá
        ELSIF v_country_id = 'US' THEN
            v_salary := v_salary * 1.25; -- Aumento del 25% en Estados Unidos
        ELSIF v_country_id = 'UK' THEN
            v_salary := v_salary * 1.28; -- Aumento del 28% en Reino Unido
        -- Puedes agregar más condiciones para otros países aquí
        END IF;
        
        -- Actualiza el salario del empleado
        UPDATE employees
        SET salary = v_salary
        WHERE employee_id = v_employee_id;
    END LOOP;

    COMMIT; -- Confirma los cambios en la tabla
END;
/

