CLASS zcl_flight DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  TYPES : tt_flight TYPE TABLE of /dmo/flight.


  CLASS-METHODS:
    read_flight_data
    EXPORTING
    et_flight type tt_flight.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_flight IMPLEMENTATION.
  METHOD read_flight_data.

  select *
  from /dmo/flight
  INTO TABLE @et_flight
  UP TO 100 ROWS.

  ENDMETHOD.

ENDCLASS.
