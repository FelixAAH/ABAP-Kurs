CLASS zcx_11_value_too_high DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    constants:
      begin of ZCX_11_VALUE_TOO_HIGH,
        msgid type symsgid value 'Z11',
        msgno type symsgno value '000',
        attr1 type scx_attrname value 'VALUE',
        attr2 type scx_attrname value '',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
      end of ZCX_11_VALUE_TOO_HIGH.

    DATA value type i.

    METHODS constructor
      IMPORTING

        !previous LIKE previous OPTIONAL
        value     type i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_11_value_too_high IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).
    if_t100_message~t100key = zcx_11_value_too_high.
    me->value = value.
  ENDMETHOD.
ENDCLASS.
