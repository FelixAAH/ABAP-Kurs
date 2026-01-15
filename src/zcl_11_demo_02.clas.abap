CLASS zcl_11_demo_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_demo_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA result_p TYPE p DECIMALS 3.
  DATA result_i TYPE i.

**********************************************************************
  " Mathematische Operationen
  result_p = 5 + 3.
  out->write( result_p ).

  result_p = 5 - 3.
  out->write( result_p ).

  result_p = 5 * 3.
  out->write( result_p ).

  result_p = 5 / 3.
  out->write( result_p ).

  result_p = 5 div 3.
  out->write( result_p ).

  result_p = 5 mod 3.
  out->write( result_p ).

  result_p = 5 ** 3.
  out->write( result_p ).

  result_i = result_i + 1.
  result_i += 1.
  ADD 1 TO result_i.
  out->write( result_i ).


**********************************************************************
" Numerische Funktionen
  result_i = sqrt( 81 ).
  out->write( result_i ).

  result_p = round( val = '47.895' dec = 2 ).
  out->write( result_p ).



  ENDMETHOD.
ENDCLASS.
