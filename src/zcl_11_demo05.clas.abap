CLASS zcl_11_demo05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    class-methods divide
          importing
             operand1             TYPE Z11_DECIMAL
             operand2             TYPE Z11_DECIMAL
          returning value(result) TYPE Z11_DECIMAL
          RAISING cx_sy_zerodivide.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_demo05 IMPLEMENTATION.


  METHOD divide.
  " Eingabeprüfung
    IF operand2 is INITIAL. " IF operand2 = 0
      RAISE EXCEPTION TYPE cx_sy_zerodivide.
    ENDIF.

    result = operand1 / operand2.
  ENDMETHOD.


ENDCLASS.
