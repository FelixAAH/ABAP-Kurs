CLASS zcl_11_demo7 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_demo7 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA connection type z11_connection.
    DATA flight TYPE Z11_FLIGHT.
    DATA flight_extended type Z11_FLIGHT_EXTENDED.



    connection-carrier_id = 'LH'.
    connection-connection_id = '0400'.
    connection-airport_from_id = 'FRA'.
    connection-airport_to_id = 'JFK'.

    flight-carrier_id = 'LH'.
    flight-connection_id = '0400'.
    flight-flight_date = '20260113'.


    flight_extended = corresponding #( flight ).
    flight_extended = corresponding #( base ( flight_extended ) connection ).


    out->write( connection-carrier_id ).
    out->write( connection-connection_id ).
    out->write( connection-airport_from_id ).
    out->write( connection-airport_to_id ).

    out->write( flight_extended ).


  ENDMETHOD.
ENDCLASS.
