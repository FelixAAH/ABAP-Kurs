CLASS zcl_11_abap_ex07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_abap_ex07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA(ergebnis) = ZCL_HELPER=>GET_TRAVELS( 1 ).

  "delete ergebnis where BEGIN_DATE < sy-datum.

  "DATA kapitalismus type ref to /DMO/TRAVEL.
   "LOOP AT ergebnis reference into kapitalismus.
      "kapitalismus->BOOKING_FEE = kapitalismus->BOOKING_FEE * '1.1' .
   "ENdLOOP.

   "SORT ergebnis by DESCRIPTION descending.

    out->write( ergebnis ).

  ENDMETHOD.
ENDCLASS.
