-- Search by employee_id or name
DECLARE
    v_found BOOLEAN := FALSE;
BEGIN
    GO_BLOCK('Employees01');
    FIRST_RECORD;

    LOOP
        EXIT WHEN :SYSTEM.LAST_RECORD = 'TRUE';

        IF 
           TO_char( :Employees01.Employee_ID) = :CTRL_BLOCK.SEARCHINPUT
            OR UPPER(:Employees01.FIRST_NAME) = UPPER(:CTRL_BLOCK.SEARCHINPUT)
            OR UPPER(:Employees01.LAST_NAME) = UPPER(:CTRL_BLOCK.SEARCHINPUT)
        THEN
            v_found := TRUE;
            EXIT;
        END IF;

        NEXT_RECORD;
    END LOOP;

    IF NOT v_found THEN
        MESSAGE('No matching employee found');
        MESSAGE(' ', NO_ACKNOWLEDGE);
    END IF;
END;