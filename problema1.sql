/*Problema 01
Crear un procedimiento almacenado SAVE_LOCATION, cuyos parámetros de entrada van a ser todas las columnas de la tabla LOCATIONS,
pero el parámetro referente al id (p_location_id) va a ser un parámetro IN OUT. 
La lógica es que cuando en p_location_id se le envíe un valor 0, se inserte un nuevo registro en la tabla LOCATIONS y 
en este parámetro se establezca el valor del id del registro insertado según la secuencia LOCATIONS_SEQ. 
Si el valor que se envía en p_location_id es diferente de 0, lo que se va a hacer es actualizar (UPDATE) el registro de 
la tabla LOCATIONS con el valor del identificador especificado.
*/


CREATE OR REPLACE PROCEDURE SAVE_LOCATION (
    p_location_id IN OUT NUMBER,
    p_street_address LOCATIONS.STREET_ADDRESS%TYPE,
    p_postal_code LOCATIONS.POSTAL_CODE%TYPE,
    p_city LOCATIONS.CITY%TYPE,
    p_state_province LOCATIONS.STATE_PROVINCE%TYPE,
    p_country_id LOCATIONS.COUNTRY_ID%TYPE
) AS
BEGIN
    -- Comprobar si p_location_id es 0
    IF p_location_id = 0 THEN
        -- Insertar un nuevo registro en la tabla LOCATIONS
        INSERT INTO LOCATIONS (
            LOCATION_ID,
            STREET_ADDRESS,
            POSTAL_CODE,
            CITY,
            STATE_PROVINCE,
            COUNTRY_ID
        ) VALUES (
            LOCATIONS_SEQ.NEXTVAL,
            p_street_address,
            p_postal_code,
            p_city,
            p_state_province,
            p_country_id
        ) RETURNING LOCATION_ID INTO p_location_id;
    ELSE
        -- Actualizar el registro existente en la tabla LOCATIONS
        UPDATE LOCATIONS
        SET
            STREET_ADDRESS = p_street_address,
            POSTAL_CODE = p_postal_code,
            CITY = p_city,
            STATE_PROVINCE = p_state_province,
            COUNTRY_ID = p_country_id
        WHERE LOCATION_ID = p_location_id;
    END IF;
    
    COMMIT; 
END;
/

SELECT * FROM LOCATIONS;
