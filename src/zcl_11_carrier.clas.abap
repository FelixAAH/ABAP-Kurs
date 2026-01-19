CLASS zcl_11_carrier DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    Methods constructor IMPORTING name TYPE string.

    Methods add_plane IMPORTING airplane TYPE REF TO zcl_11_airplane.

    METHODS get_biggest_cargo_plane RETURNING VALUE(plane) TYPE i.

    DATA name TYPE string READ-ONLY.
    DATA airplanes TYPE TABLE OF REF TO zcl_11_airplane READ-ONLY.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_carrier IMPLEMENTATION.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.


  METHOD add_plane.
    APPEND airplane TO me->airplanes.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.

    DATA airplane TYPE REF TO zcl_11_airplane.
    DATA cargo_plane TYPE REF TO zcl_11_cargo_plane.

    LOOP AT airplanes INTO airplane.

      IF airplane IS INSTANCE OF zcl_11_cargo_plane.
        cargo_plane = CAST #( airplane ).
        if cargo_plane->get_total_weight_in_tons( 10 ) > plane.
          plane = cargo_plane->get_total_weight_in_tons( 10 ).
        ENDIF.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.


