
create or replace function fn_service_order_item_insert()
returns trigger as
$$
begin
    IF EXISTS( SELECT *
            FROM 
                SERVICE_ORDER_ITEMS 
            WHERE 
                SERVICE_ORDER_ITEMS.create_date = NEW.create_date 
                AND SERVICE_ORDER_ITEMS.service_id = NEW.service_id
                AND SERVICE_ORDER_ITEMS.reservation_id = NEW.reservation_id
            ) THEN
        
    ELSE

    END IF;

end;
$$
language 'plpgsql'