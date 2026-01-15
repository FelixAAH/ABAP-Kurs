CLASS zcl_11_demo06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_demo06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  try.
      DATA(result) = ZCL_11_DEMO05=>divide( operand1 =  5 operand2 = 0 ).
      out->write( result ).
    catch cx_sy_zerodivide into data(x).
      out->write( x->get_text(  ) ).
  endtry.

  ENDMETHOD.
ENDCLASS.
