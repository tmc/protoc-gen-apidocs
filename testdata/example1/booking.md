---
title: com.example.booking
description: API Specification for the com.example.booking package.
---

<a name="booking-proto"></a><p align="right"><a href="#top">Top</a></p>

<!-- begin services -->


<a name="com-example-booking-BookingService"></a>

### BookingService

Service for handling vehicle bookings.



| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| BookVehicle | [Booking](#com-example-booking-Booking) | [BookingStatus](#com-example-booking-BookingStatus) | Used to book a vehicle. Pass in a Booking and a BookingStatus will be returned.   |
| BookingUpdates | [BookingStatusID](#com-example-booking-BookingStatusID) | [BookingStatus](#com-example-booking-BookingStatus) stream | Used to subscribe to updates of the BookingStatus.   |



<!-- begin services -->



<a name="com-example-booking-BookingStatusID"></a>

### BookingStatusID

Represents the booking status ID.




| Field | Type | Description |
| ----- | ---- | ----------- |
| id |int32|  Unique booking status ID.  |




 <!-- end nested messages -->

 <!-- end nested enums -->




<a name="com-example-booking-BookingStatus"></a>

### BookingStatus

Represents the status of a vehicle booking.




| Field | Type | Description |
| ----- | ---- | ----------- |
| id |int32|  Unique booking status ID.  |
| description |string|  Booking status description. E.g. "Active".  |




 <!-- end nested messages -->

 <!-- end nested enums -->




<a name="com-example-booking-Booking"></a>

### Booking

Represents the booking of a vehicle.

Vehicles are quite fun. But drive carefully!




| Field | Type | Description |
| ----- | ---- | ----------- |
| vehicle_id |int32|  ID of booked vehicle.  |
| customer_id |int32|  Customer that booked the vehicle.  |
| status |[BookingStatus](#com-example-booking-BookingStatus)|  Status of the booking.  |
| confirmation_sent |bool| Has booking confirmation been sent?   |
| payment_received |bool| Has payment been received?   |
| color_preference |string|  Color preference of the customer.  |




 <!-- end nested messages -->

 <!-- end nested enums -->




<a name="com-example-booking-EmptyBookingMessage"></a>

### EmptyBookingMessage

An empty message for testing







 <!-- end nested messages -->

 <!-- end nested enums -->


 <!-- end messages -->

<!-- begin file-level enums -->
 <!-- end file-level enums -->

<!-- begin file-level extensions -->
 <!-- end file-level extensions -->

