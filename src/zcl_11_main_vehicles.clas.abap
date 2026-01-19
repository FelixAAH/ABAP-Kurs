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

    DATA rental TYPE ref to zcl_11_rental.
    DATA carrier type ref to zcl_11_carrier.
    DATA partners type table of ref to zif_11_partner.

  " Instanziierungen
    out->write( zcl_11_vehicle=>number_of_vehicles ).

    vehicle = new zcl_11_car( make = 'Porsche'
                              model = '911'
                              seats = 2 ). "Upcast
    append vehicle to vehicles.

    vehicle = new zcl_11_truck( make = 'MAN'
                                model = 'TGX'
                                cargo_in_tons = 40 ). "Upcast
    append vehicle to vehicles.

    vehicle = new zcl_11_car( make = 'Skoda'
                              model = 'Superb Combi'
                              seats = 4 ). " Upcast
    append vehicle to vehicles.


   " Ausgabe

    LOOP at vehicles into vehicle.
      TRY.
        vehicle->accelerate( 30 ).
        vehicle->brake( 40 ).
        vehicle->accelerate( 100 ).
      CATCH zcx_11_value_too_high INTO DATA(x).
        out->write( | { x->get_text( ) } get kirked | ).
      ENDTRY.
      out->write( vehicle->to_string( ) ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
