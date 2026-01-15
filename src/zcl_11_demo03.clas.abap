CLASS zcl_11_demo03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_demo03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  "Einfache Verzweigungen
  DATA age TYPE i VALUE 20.
  DATA gender TYPE c length 1 value 'M'. " DATA gender
  DATA first_name type c length 40 value 'Felix'.
  DATA last_name TYPE c length 40 value 'Fischer'.


" Vergleichsoperatoren: >, >=, <, <=, =, <>
" Logische operatoren: AND, OR, NOT
" + IS (NOT) INITIAL

  if age < 18.
    out->write( |Hallo { first_name }| ).
    elseif gender = 'm' or gender = 'M'.
      out->write( |Hallo Herr { last_name }| ).
    elseif gender = 'w' or gender = 'W'.
      out->write( |Hallo Frau { last_name }| ).
    ELSE.
      out->write( |Hallo { last_name }| ).
    endif.

    out->write( |Hallo { cond #( when age < 18 then first_name
                                 when gender = 'm' or gender = 'M' THEN | Herr | && last_name
                                 when gender = 'w' or gender = 'W' THEN | Frau | && last_name
                                 else last_name ) }| ).


    IF age IS INITIAL. " IF age = 0.
      out->write( |kein Alter angegeben| ).
    ENDIF.

" FALLUNTERSCHEIDUNGEN

  case gender.
    when 'm' or 'M'.
      out->write( |Hallo Herr { last_name }| ).
    when 'w' or 'W'.
      out->write( |Hallo Frau { last_name }| ).
    when OTHERS.
      out->write( |Hallo { last_name }| ).
  endcase.

  out->write(  |Hallo { switch #(  gender when 'm' or 'M' then |Herr| && last_name
                                          when 'w' or 'W' then |Frau| && last_name
                                          else                           last_name ) }| ).



  ENDMETHOD.
ENDCLASS.
