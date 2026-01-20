CLASS zcl_11_demo09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_demo09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    SELECT FROM Z11_DEMO07( P_CarrierID = 'LH',p_deadline = @sy-datum )
    FIELDS *
*    WHERE CarrierId = 'LH'
    INTO TABLE @DATA(flights).
    out->write( flights ).
  ENDMETHOD.
ENDCLASS.
