CLASS zcl_11_calculate_percentage DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    class-methods percentage
          importing
             prozentsatz             TYPE Z11_DECIMAL
             basis                   TYPE Z11_DECIMAL
          returning value(result) TYPE Z11_DECIMAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_calculate_percentage IMPLEMENTATION.

  METHOD percentage.
    result = prozentsatz / 100 * basis.
  ENDMETHOD.

ENDCLASS.
