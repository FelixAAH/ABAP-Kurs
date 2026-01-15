CLASS zcl_11_demo9 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_demo9 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA carrier_id type /dmo/carrier_id.
  data connection_id type /dmo/connection_id.

  DATA connection type /DMO/CONNECTION.
  DATA connections type table of /DMO/CONNECTION.

  " SELECT * FROM [DATENBANKQUELLE] WHERE [BEDINGUNG]

  "Lesen von Einzelsätzen


  SELECT SINGLE FROM /DMO/CONNECTION
    FIELDS *
    WHERE carrier_id = @carrier_id AND connection_id = @connection_id
    INTO @connection.
  out->write( connections ).

  "Lesen mehrer Datensätze per array fetch

  SELECT FROM /DMO/CONNECTION
  FIELDS *
  WHERE carrier_id = @carrier_id
  INTO TABLE @connections.

  out->write( connections ).

" Mehrere Datensätze per select-schleife

    SELECT FROM /DMO/CONNECTION
    FIELDS *
    WHERE carrier_id = @carrier_id
    into @connection.

    ENDSELECT.




  ENDMETHOD.
ENDCLASS.
