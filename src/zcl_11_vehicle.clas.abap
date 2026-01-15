CLASS zcl_11_vehicle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      METHODS constructor importing make type string
                                  model TYPE string.


      METHODS accelerate
        importing value type i raising zcx_11_value_too_high.

      methods brake
        importing value type i raising zcx_11_value_too_high.

      DATA make type string READ-ONLY.
      DATA model type string  READ-ONLY.
      DATA speed_in_kmh TYPE i READ-ONLY.

      CLASS-DATA number_of_vehicles type i READ-only.

  PRIVATE SECTION.


ENDCLASS.



CLASS zcl_11_vehicle IMPLEMENTATION.


  METHOD accelerate.
    if speed_in_kmh + value > 300.
      raise exception new zcx_11_value_too_high( value = value ).
    endif.
    speed_in_kmh += value.
  ENDMETHOD.

  METHOD brake.
    if value > speed_in_kmh.
      raise exception new zcx_11_value_too_high( value = value ).
    endif.
    speed_in_kmh -= value.
  ENDMETHOD.

  METHOD constructor.
    me->make = make.
    me->model = model.
  ENDMETHOD.

ENDCLASS.
