CLASS zcl_11_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_11_vehicle

  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA cargo_in_tons type i READ-ONLY.
    methods constructor
      importing
        make      TYPE string
        model     TYPE string
        cargo_in_tons TYPE i.

     METHODS to_string redefinition.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_truck IMPLEMENTATION.
  METHOD constructor.

    super->constructor( make = make model = model ).
    me->cargo_in_tons = cargo_in_tons.

  ENDMETHOD.

  METHOD to_string.
    string = super->to_string( ).
    string &&= |, Frachkapazität: { cargo_in_tons }t|.
  ENDMETHOD.

ENDCLASS.
