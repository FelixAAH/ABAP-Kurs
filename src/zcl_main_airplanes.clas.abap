CLASS zcl_main_airplanes DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_main_airplanes IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**********************************************************************
* Deklarationen
**********************************************************************
    DATA airplane  TYPE REF TO zcl_11_airplane.
    DATA airplanes TYPE TABLE OF REF TO zcl_11_airplane.

**********************************************************************
* Instanziierungen
**********************************************************************

    out->write( zcl_11_airplane=>number_of_planes ).

    try.
        airplane = NEW #( id = '1' plane_type = 'Airbus' empty_weight_in_tons = '15' ).
        APPEND airplane TO airplanes.
      catch ZCX_ABAP_INITIAL_PARAMETER INTO DATA(z).
        out->write( | { z->get_text( ) } get kirked |  )..
    endtry.

    try.
        airplane = NEW #( id = '2' plane_type = 'Boeing' empty_weight_in_tons = '15' ).
        APPEND airplane TO airplanes.
      catch ZCX_ABAP_INITIAL_PARAMETER INTO DATA(x).
        out->write( | { x->get_text( ) } get kirked |  ).
    endtry.

    try.
        airplane = NEW #( id = '3' plane_type = '' empty_weight_in_tons = '15' ).
        APPEND airplane TO airplanes.
      catch ZCX_ABAP_INITIAL_PARAMETER INTO DATA(y).
        out->write( | { y->get_text( ) } get kirked | ).
    endtry.

    out->write( zcl_11_airplane=>number_of_planes ).

**********************************************************************
* Ausgabe
**********************************************************************
    LOOP AT airplanes INTO airplane.
      out->write( |{ airplane->plane_type } { airplane->empty_weight_in_tons }| ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
