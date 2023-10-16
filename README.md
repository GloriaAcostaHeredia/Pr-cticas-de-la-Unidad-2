# Pr-cticas-de-la-Unidad-2
Administración de Bases de Datos: Prácticas Unidad 2 Entregable por Acosta Heredia
Administración de Bases de Datos: Prácticas Unidad 2
### Problema 01
Crear un procedimiento almacenado SAVE_LOCATION, cuyos parámetros de entrada van a ser todas las columnas de la tabla LOCATIONS, pero el parámetro referente al id (p_location_id) va a ser un parámetro IN OUT. La lógica es que cuando en p_location_id se le envíe un valor 0, se inserte un nuevo registro en la tabla LOCATIONS y en este parámetro se establezca el valor del id del registro insertado según la secuencia LOCATIONS_SEQ. Si el valor que se envía en p_location_id es diferente de 0, lo que se va a hacer es actualizar (UPDATE) el registro de la tabla LOCATIONS con el valor del identificador especificado.
### Problema 02
Crear function GET_TAXES_OF_SALARY el cual obtendrá el porcentaje correspondiente de impuestos en relación al salario. Esta función tendrá como parámetro de entrada p_salary NUMBER(8, 2) y devolverá el porcentaje correspondiente de impuestos a pagar según la siguiente tabla
Rango de salario            Porcentaje de impuesto
menor de 5,000                      8%
5,000 a < 7,500                     10%
7,500 a < 10,000                    13%
10,000 a < 15,000                   16%
15,000 a < 20,000                   19%
20,000 a < 50,000                   25%
50,000 en adelante                  30%

Nota: Para regresar un porcentaje, es mejor manejar el relación a 1; por ejemplo, si el porcentaje es 10%, se regresa 0.1, si es 20%, regresar 0.2, si es 5% regresar 0.05.

### Problema 03
Crear function SALARY_AFTER_TAXES para calcular el salario del empleado después de impuestos, esto es descontando el impuesto. Esta función va a tener como parámetro p_salary NUMBER(8, 2) y regresar el salario descontando el porcentaje de impuestos, según la tabla anterior.

### Problema 04
Crear function GET_CANT_JOBS qué tenga como parámetro p_employee_id, el cual contará en la tabla JOB_HISTORY la cantidad de registros de JOB que tiene un empleado; regresar este valor (cantidad de jobs del empleado).

### Problema 05
Crear stored procedure CALC_PAYROLL en el cuál va a tener los parámetros p_taxes OUT NUMBER(18, 3) y p_to_pay OUT NUMBER(18, 3). En p_taxes se va a regresar el valor correspondiente a la sumatoria de todos los impuestos que hay que pagar por cada empleado (según la tabla del problema 02), y en p_to_pay se regresa la sumatoria de todo lo que hay que pagar a los empleados descontando el impuesto de cada uno.

### Problema 06
La empresa quiere realizar un aumento de sueldo a todos los empleados.Este aumento dependerá del país en donde se encuentre trabajando.Si el empleado está trabajando en CA (Canadá), se le aumentará un 20% su sueldo; en US (United States of America) se le aumentará un 25%, en UK (United Kingdom) un 28%; en otras locaciones no se aumentará el salario. Para esto cree un bloque de código anónimo de PL/SQL para realizar la operación. Nota: Aquí se usan cursores.

### Problema 07
Ahora la empresa quiere realizar un aumento de sueldo a todos los empleados según la región en donde estén trabajando. Para la región de “Americas”, el aumento del sueldo será de un 5% y para la región de “Europe” de 8%. Este problema también ocupará un bloque de código PL/SQL anónimo en donde se usen cursores.

### Problema 08
La empresa se dió cuenta que aún con los aumentos dados todavía tenía empleados que no ganaban lo suficiente, por lo que decidió dar un aumento extra del 10% a los 5 empleados que menos ganan. Realizar el bloque anónimo de código PL/SQL para realizar esta operación.

### Problema 09
Para que la empresa pudiera realizar todos los aumentos de sueldo antes mencionados, tuvo que realizar recortes en el sueldo de los dos empleados que más ganan a excepción del empleado que más gana, que es el Presidente de la empresa. Cree un bloque de código anónimo para realizar la operación de reducir el 10% el salario de los dos empleados que más ganan después del Presidente. 

### Problema 10
Crear un stored procedure que se llame SAVE_EMPLOYEE en el cual tenga como parámetros todos los campos de la tabla EMPLOYEES y los tipos de datos correspondientes a esta tabla, los nombres de los parámetros van a ser los mismos que los nombres de las columnas de la tabla, pero con el prefijo p_ (employee_id sería p_employee_id). Todos van a ser parámetros de entrada excepto p_employee_id el cual va a ser IN OUT. La funcionalidad de este stored procedure será que cuando se le envíe un valor NULL o 0 en p_employee_id, se realizará la operación de INSERT en la tabla empoyees con los todos los datos enviados en los parámetros, y en p_employee_id se regresará el identificador del registro insertado según la secuencia EMPLOYEE_SEQ. Cuando se establece un valor en p_employee_id, se realizará una operación de UPDATE del registro con ese identificador, con todos los datos enviados como parámetros.

### Problema 11
Crear un bloque de código anónimo en PL/SQL en el cual se realicen las siguientes operaciones: invocar el stored procedure SAVE_EMPLOYEE para una prueba de operación de insert, especificando todos los parámetros necesarios; después invocar este mismo stored procedure pero para modificar un registros (cuando se especifica un valor en el parámetro p_employee_id.

