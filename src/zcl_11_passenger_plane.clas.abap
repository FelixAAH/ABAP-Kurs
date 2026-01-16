CLASS zcl_11_passenger_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_11_airplane
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA number_of_seats type i READ-ONLY.
    METHODS constructor
      IMPORTING
        id TYPE string
        plane_type TYPE string
        empty_weight_in_tons TYPE i
        number_of_seats type i
        raising ZCX_ABAP_INITIAL_PARAMETER.

    METHODS get_total_weight_in_tons redefinition.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_passenger_plane IMPLEMENTATION.

  METHOD constructor.

    super->constructor( id = id plane_type = plane_type empty_weight_in_tons = empty_weight_in_tons ).
    me->number_of_seats = number_of_seats.

  ENDMETHOD.

  METHOD get_total_weight_in_tons.
    total_weight = empty_weight_in_tons * '1.1' + number_of_seats * '0.08'.
  ENDMETHOD.

ENDCLASS.
