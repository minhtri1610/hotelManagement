
create or replace function fn_service_order_item_insert()
returns trigger as
$$
declare rec record;
declare	v_quantity integer := 0;
declare	v_price integer := 0;
begin
    IF EXISTS( SELECT *
            FROM 
                SERVICE_ORDERS 
            WHERE 
                SERVICE_ORDERS.create_date = NEW.create_date 
                AND SERVICE_ORDERS.service_id = NEW.service_id
                AND SERVICE_ORDERS.reservation_id = NEW.reservation_id
            ) THEN

            for rec in select price
                    from SERVICE_ORDER_ITEMS 
                    where 
                    SERVICE_ORDER_ITEMS.create_date = NEW.create_date 
                AND SERVICE_ORDER_ITEMS.service_id = NEW.service_id
                AND SERVICE_ORDER_ITEMS.reservation_id = NEW.reservation_id
            loop
                v_quantity = v_quantity + 1;
                v_price = v_price + rec.price;
            end loop;

            --update
            UPDATE 
                SERVICE_ORDERS 
            SET 
                total_price = v_price,
                quantity = v_quantity
            WHERE 
                    SERVICE_ORDERS.create_date = NEW.create_date 
                    AND SERVICE_ORDERS.service_id = NEW.service_id
                    AND SERVICE_ORDERS.reservation_id = NEW.reservation_id;


    ELSE
        INSERT INTO SERVICE_ORDERS(reservation_id, create_date, service_id, quantity, total_price)
            VALUES (NEW.reservation_id, NEW.create_date, NEW.service_id, 1, NEW.price);
        --create
    END IF;
    return NEW;

end;
$$
language 'plpgsql';


-- trigger khi xóa 1 dòng trong bảng SERVICE_ORDER_ITEMS
create or replace function fn_service_order_item_delete()
returns trigger as
$$
declare rec record;
declare	v_quantity integer := 0;
declare	v_price integer := 0;
begin
    IF EXISTS( SELECT *
            FROM 
                SERVICE_ORDERS 
            WHERE 
                SERVICE_ORDERS.create_date = OLD.create_date 
                AND SERVICE_ORDERS.service_id = OLD.service_id
                AND SERVICE_ORDERS.reservation_id = OLD.reservation_id
            ) THEN

            for rec in select price
                    from SERVICE_ORDER_ITEMS 
                    where 
                    create_date = OLD.create_date 
                AND service_id = OLD.service_id
                AND reservation_id = OLD.reservation_id
            loop
                v_quantity = v_quantity + 1;
                v_price = v_price + rec.price;
            end loop;

            --update
            UPDATE 
                SERVICE_ORDERS 
            SET 
                total_price = v_price,
                quantity = v_quantity
            WHERE 
                    SERVICE_ORDERS.create_date = OLD.create_date 
                    AND SERVICE_ORDERS.service_id = OLD.service_id
                    AND SERVICE_ORDERS.reservation_id = OLD.reservation_id;


    ELSE
        INSERT INTO SERVICE_ORDERS(reservation_id, create_date, service_id, quantity, total_price)
            VALUES (OLD.reservation_id, OLD.create_date, OLD.service_id, 1, OLD.price);
        --create
    END IF;
    return OLD;

end;
$$
language 'plpgsql';


create trigger tg_service_order_insert after insert on SERVICE_ORDER_ITEMS
for each row execute procedure fn_service_order_item_insert();

create trigger tg_service_order_update after update on SERVICE_ORDER_ITEMS
for each row execute procedure fn_service_order_item_insert();

create trigger tg_service_order_delete after delete on SERVICE_ORDER_ITEMS
for each row execute procedure fn_service_order_item_delete();