-- Liệt kê những phòng đang trống
select distinct room_id 
from rooms 
where room_id not in (select room_id from reservations where real_check_out_date is null);
-- Liệt kê những phòng đang trống trong 3 ngày tới
select distinct room_id 
from rooms 
where room_id 
not in (select room_id from reservations where real_check_out_date is null) 
and room_id in (select room_id from reservations where date_part('day',est_check_out_date::timestamp - CURRENT_DATE) <= 3);
-- Liệt kê xem tầng 1 có bao nhiêu phòng
select number_of_room from floors;
-- Liệt kê xem từ tháng x tới tháng y năm z có bao nhiêu đợt đặt phòng
select count(reservation_id) from reservations where create_at < '2022-05-05';