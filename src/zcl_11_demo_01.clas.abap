CLASS zcl_11_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_demo_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
**********************************************************************
* Hello World
**********************************************************************
    DATA text TYPE string.  " Deklaration
    text = 'Hello World'. "Wertzuweisung
* Ausgabe
*    out->write( text ).

**********************************************************************
* Datentypen und Datenobjekte
**********************************************************************
  DATA age TYPE i. " Ganze Zahlen
  DATA salary_in_euro type p length 16 decimals 2. " Kommazahlen
  DATA first_name TYPE c length 40. " Zeichenketten fester Länge
  DATA matriculation_number type n length 7. " Zeichenketten nur mit Ziffern
  DATA flag. " Kennzeichen
  DATA xmas TYPE d. " Datum
  DATA noon TYPE t. " Zeitangaben

  DATA carrier_id TYPE c length 3. " ABAP Standardtyp
  DATA carrier_id2 TYPE /dmo/carrier_id. " Datenelement

**********************************************************************
* Wertzuweisung

  age = 44.
  salary_in_euro = '6000.52'.
  first_name = 'Bruce'.
  matriculation_number = '9182643'.
  xmas = '20261225'.
  noon = '120000'.
  flag = 'X'.

  flag = ''.

  clear flag.

  " Statische Vorbelegung
  DATA LAST_NAME TYPE C LENGTH 40 VALUE 'Wayne'.

  " Inlinedeklaration
  DATA(size_in_cm) = 179.
  size_in_cm = '179'.

  out->write( |Hello { first_name } { LAST_NAME }, how are you? | ).


  DATA customer TYPE /dmo/CUSTOMER.
    customer-customer_id = '19286'.
    customer-first_name = 'Bruce'.
    customer-last_name = 'Wayne'.
    customer-city = 'Gotham City'.
    customer-country_code = 'US'.

    out->write( |{ customer-customer_id }, { customer-first_name } { customer-last_name }, { customer-city } ({ customer-country_code }) | ).

  ENDMETHOD.
ENDCLASS.
