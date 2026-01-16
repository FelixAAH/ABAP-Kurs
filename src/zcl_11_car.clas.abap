CLASS zcl_11_car DEFINITION
  PUBLIC
  INHERITING FROM zcl_11_vehicle
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA seats type i READ-ONLY.
    METHODS constructor
      IMPORTING
        make TYPE string
        model TYPE string
        seats TYPE i.

     methods to_string redefinition.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_car IMPLEMENTATION.

  METHOD constructor.

    super->constructor( make = make model = model ).

      me->seats = seats.
  ENDMETHOD.

  method to_string.
    string = | { make } { model } ({ speed_in_kmh }km/h, { seats } Sitzplaätze) |.
    endmethod.
ENDCLASS.
