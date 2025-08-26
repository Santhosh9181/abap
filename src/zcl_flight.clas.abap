CLASS zcl_flight DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_oo_adt_classrun.
    TYPES : tt_flight TYPE TABLE OF /dmo/flight.


    CLASS-METHODS:
      read_flight_data
        EXPORTING
          et_flight TYPE tt_flight.
    CLASS-EVENTS : trigger_read.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FLIGHT IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*me->if_oo_adt_classrun
    DATA : lt_flight TYPE tt_flight.
    read_flight_data( IMPORTING et_flight = lt_flight ).
    out->write( lt_flight ).
  ENDMETHOD.


  METHOD read_flight_data.

    SELECT *
    FROM /dmo/flight
    INTO TABLE @et_flight
    UP TO 100 ROWS.
    RAISE EVENT trigger_read.

  ENDMETHOD.
ENDCLASS.
