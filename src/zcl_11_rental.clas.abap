CLASS zcl_11_rental DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES ty_vehicles type table of ref to ZCL_11_vehicle.

    DATA vehicles type ty_vehicles READ-ONLY.

      methods add_vehicle
        importing
           vehicle type ref to zcl_11_vehicle.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_rental IMPLEMENTATION.

  METHOD add_vehicle.

    append vehicle to vehicles.

  ENDMETHOD.

ENDCLASS.
