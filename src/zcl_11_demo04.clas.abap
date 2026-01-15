CLASS zcl_11_demo04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_demo04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**********************************************************************
" While Schleife  ---> bracuht man nicht
 " while sy-index <= 10.
  "  out->write( sy-index ).
  "endwhile.

**********************************************************************
* do Schleife     ---> braucht man nicht

 " do 10 times.
 "   out->write( sy-index ).
 " enddo.

  "do.
   " out->write( sy-index ).
   " if sy-index = 10.
   " exit.
  "  endif.
 " enddo.

**********************************************************************

DATA operand1 type Z11_DECIMAL.
DATA operand2 TYPE Z11_DECIMAL.
DATA operator type c length 2.
DATA result TYPE Z11_DECIMAL.


operand1 = '50'.
operand2 = '200'.
operator = '**'.


  if operand2 = 0 and operator = '/'.
    out->write( 'Division by zero' ) ##NO_TEXT.
    return.
  endif.

  if operator = '+'.
    result = operand1 + operand2.
  elseif operator = '-'.
    result = operand1 - operand2.
  elseif operator = '*'.
    result = operand1 * operand2.
  elseif operator = '/'.
    result = operand1 / operand2.
  elseif operator = '%'.
    result = ZCL_11_calculate_percentage=>percentage( prozentsatz = operand1 basis = operand2 ).
  elseif operator = '**'.
    try.
      result = ZCL_ABAP_CALCULATOR=>CALCULATE_POWER( base = operand1 exponent = CONV i( operand2 ) ).
      out->write( result ).
    catch zcx_abap_exponent_too_high into data(x).
      out->write( x->get_text(  ) ).
    endtry.
  endif.


  out->write( |{ operand1 NUMBER = USER } { operator } { operand2 NUMBER = USER } = { result NUMBER = USER }|  ).
  ENDMETHOD.
ENDCLASS.
