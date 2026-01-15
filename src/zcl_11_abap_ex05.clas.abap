CLASS zcl_11_abap_ex05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_abap_ex05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  DATA customer type Z11_CUSTOMER_INFO.
  try.
    DATA(info) = ZCL_ABAP_HELPER=>GET_CUSTOMER( 000500 ) .
  catch zcx_abap_NO_DATA into data(x).
      out->write( x->get_text(  ) ).
    endtry.

  out->write( info ).


  ENDMETHOD.
ENDCLASS.
