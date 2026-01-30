CREATE OR REPLACE FUNCTION function_name()
RETURN TRIGGER
LANGUAGE plpgsql 
AS
$$
BEGIN

END;
$$

CREATE TRIGGER trigger_name
{} {}
ON table_name
[FOR EACH ROW]
EXECUTE FUNCTION function_name

-- TG_OP
