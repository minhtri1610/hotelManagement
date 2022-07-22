CREATE PROCEDURE insert_data(customer_id)
LANGUAGE SQL
AS $$

$$;


CREATE PROCEDURE calculatorServicePrice(customer_id integer)
LANGUAGE SQL

AS $$
declare	total_price integer := 0;
declare rec record;
for rec in select SERVICE_ORDERS.total_price
            from SERVICE_ORDERS
            left join RESERVATIONS on RESERVATIONS.reservation_id = SERVICE_ORDERS.reservation_id
            where RESERVATIONS.customer_id = customer_id
    loop
        total_price = total_price + rec.total_price;
    end loop;

return total_price;

$$;
