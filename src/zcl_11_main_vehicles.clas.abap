CLASS zcl_11_main_vehicles DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_main_vehicles IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  " Deklarationen
    data vehicle type REF to zcl_11_vehicle.
    DATA vehicles type table of REF to zcl_11_vehicle.

  " Instanziierungen
    out->write( zcl_11_vehicle=>number_of_vehicles ).

    vehicle = new #( make = 'Porsche' model = '911'  ).
    append vehicle to vehicles.

    vehicle = new #( make = 'MAN' model = 'TGX' ).
    append vehicle to vehicles.

    vehicle = new #( make = 'Skoda' model = 'Superb Combi' ).
    append vehicle to vehicles.


   " Ausgabe

    LOOP at vehicles into vehicle.
      TRY.
        vehicle->accelerate( 30 ).
        vehicle->brake( 40 ).
        vehicle->accelerate( 100 ).
      CATCH zcx_11_value_too_high INTO DATA(x).
        out->write( x->get_text( ) ).
      ENDTRY.
      out->write( | { vehicle->make }   { vehicle->model } | ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
