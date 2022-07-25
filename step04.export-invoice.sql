-- tính tổng hóa đơn dịch vụ
CREATE OR REPLACE FUNCTION calculator_service_price(cus_id integer)
returns float 
LANGUAGE plpgsql

AS $$
declare	total_price float := 0;
declare rec record;

begin
    for rec in select SERVICE_ORDERS.total_price
            from SERVICE_ORDERS
            left join RESERVATIONS on RESERVATIONS.reservation_id = SERVICE_ORDERS.reservation_id
            where RESERVATIONS.customer_id = cus_id
    loop
        total_price = total_price + rec.total_price;
    end loop;

return total_price;

end
$$;

-- Tính giá tiền thuê phòng của mỗi phòng theo đơn đã đặt
CREATE OR REPLACE FUNCTION calculator_room_price(reservation_id_val integer)
returns float 
LANGUAGE plpgsql

AS $$
declare	total_price float := 0;
declare rec record;

begin
    for rec in select RESERVATIONS.price_per_night, date_part('day',est_check_out_date::timestamp - check_in_date::timestamp) as days 
            from RESERVATIONS
            where RESERVATIONS.reservation_id = reservation_id_val
    loop
        total_price = rec.price_per_night * rec.days;
    end loop;
    

return total_price;

end
$$;

CREATE OR REPLACE PROCEDURE export_invoice(cus_id integer)
LANGUAGE plpgsql
AS $$
declare	price_room_total float := 0;
declare rec record;
begin
    IF NOT EXISTS(SELECT * FROM INVOICES WHERE customer_id = cus_id) THEN

        -- cập nhật lại ngày ra thực tế
        UPDATE RESERVATIONS
            SET real_check_out_date = CURRENT_DATE
        WHERE customer_id = cus_id;

        -- tính tổng tiền số ngày thực tế đã ở
        for rec in select RESERVATIONS.reservation_id
                from RESERVATIONS
                where RESERVATIONS.customer_id = cus_id
        loop
            price_room_total = price_room_total + calculator_room_price(rec.reservation_id);
        end loop;


        -- lưu dữ liệu vào bảng invoice
        insert into INVOICES(total_amount, create_date, customer_id) values(
                calculator_service_price(cus_id) + price_room_total, CURRENT_DATE, cus_id
            );
    END IF;

end
$$;


-- call export_invoice(4)