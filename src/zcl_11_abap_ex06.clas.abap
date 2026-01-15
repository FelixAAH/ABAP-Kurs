CLASS zcl_11_abap_ex06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_abap_ex06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA(ergebnis) = ZCL_HELPER=>GET_TRAVEL_WITH_CUSTOMER( 1 ) .

    out->write( ergebnis ).

  ENDMETHOD.
ENDCLASS.
