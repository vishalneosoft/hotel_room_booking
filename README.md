# hotel_room_booking

1. Postgresql for database
2. ruby 2.3.1
3. rails 5.2.1
4. run rails db:seed ie.to create rooms
5. Added Jquery Validation for rooms booking and log in and sign up.
6. Added Bootstrap.
7. Once application is started on local server on home you can directly click on book now for quick  booking of room.(need to login before booking)
8. Click on Rooms in navigation bar at top of the page. Here you can see all availbale room types and availability of rooms on specific date.
9. To check rooms availability, fill check_in date and check_out date(greater than check_in) and type of room.
  You will get count of all available rooms on that date.
10. If you don't add room type you will get all rooms available with every room_type and their count on that date.
11. After clicking on 'Book now'  button you will be redirected to booking form.
12. On booking form you need to select room type, check_in date, check_out date and Number of guests. And click on create booking.
13. When you click on create booking room will be booked for you on those dates(if available) and room number will be assigned automatically to you. And you will be redirected to booking show page.
14. By clicking on Bookings tab on navbar you can see all your bookings list also can see individual booking by clicking on show.
15. To sign_up, sign up tab is available in navbar also for login, login tab is available in navbar.