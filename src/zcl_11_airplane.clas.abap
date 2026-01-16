CLASS zcl_11_airplane DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor importing id TYPE string
                                  plane_type type string
                                  empty_weight_in_tons TYPE i
                                  raising ZCX_ABAP_INITIAL_PARAMETER.

    DATA id type string READ-ONLY.
    DATA plane_type type string READ-ONLY.
    DATA empty_weight_in_tons TYPE i READ-ONLY.

    CLASS-DATA number_of_planes type i READ-only.

    methods get_total_weight_in_tons
         importing empty_weight_in_tons type i
         RETURNING value(total_weight) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.



ENDCLASS.



CLASS zcl_11_airplane IMPLEMENTATION.


  METHOD constructor.
    me->id = id.
    me->plane_type = plane_type.
    me->empty_weight_in_tons = empty_weight_in_tons.
    number_of_planes += 1.

    if id is initial.
      raise exception new ZCX_ABAP_INITIAL_PARAMETER( id ).
    endif.

    if plane_type is initial.
      raise exception new ZCX_ABAP_INITIAL_PARAMETER( plane_type ).
    endif.

    if empty_weight_in_tons is initial.
      raise exception new ZCX_ABAP_INITIAL_PARAMETER( | { empty_weight_in_tons } | ).
    endif.

  ENDMETHOD.

  METHOD get_total_weight_in_tons.
    total_weight = empty_weight_in_tons * '1.1'.
  ENDMETHOD.

ENDCLASS.
