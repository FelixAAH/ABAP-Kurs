CLASS zcl_11_demo8 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_demo8 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    " Deklarationen interner Tabellen
    DATA connections type Z11_connections. "TYPE Tabellentyp
    DATA connections2 TYPE table of Z11_CONNECTION. "TYPE TABLE OF STRUKTURTYP
    DATA connection TYPE Z11_connection.

    " Hinzufügen von Datensätzen
    connections = value #(
    ( carrier_id    = 'LH' connection_id   = '0400' )
    ( carrier_id    = 'UA' airport_from_id = 'FRA' )
    ( connection_id = '0401' airport_to_id = 'FRA' ) ).

    " Anfügen von Datensätzen
    connection = value #( carrier_id      = 'AZ'
                          connection_id   = '0017'
                          airport_from_id = 'BER'
                          airport_to_id   = 'ROM'   ).

    connections = value #( base connections ( connection ) ).
    append connection to connections.

    " Lesen von Einzelsätzen
    TRY.
        connections[ 1 ]-airport_from_id = 'FRA'. " per Index
       CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    if line_exists( connections[ connection_id = '0400' ] ).
      connections[ connection_id = '0400' ]-connection_id = '0402'. "per Schlüsselkomponente
    endif.

   " Ändern mehrerer Datensätze per SY-TABIX
    " LOOP AT connections INTO DATA( conneciton2 )
   LOOP AT connections into connection.
      connections[ sy-tabix ]-airport_to_id = 'JFK'.
   ENdLOOP.

   " Ändern mehrerer Datensätze per Datenreferenz
   DATA connection2 type ref to Z11_connection.
   LOOP AT connections reference into connection2.
      connection2->airport_from_id = 'BER'.
   ENdLOOP.


   " Ändern mehrerer Datensätze per Feldsymbol
   FIELD-SYMBOLS <connection> type Z11_connection.
   LOOP AT connections assigning <connection>.
      <connection>-carrier_id = 'LH'.
   ENdLOOP.

   out->write( connections ).

  ENDMETHOD.
ENDCLASS.
