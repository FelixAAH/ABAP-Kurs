CLASS zcl_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    class-methods GET_TRAVEL_WITH_CUSTOMER
          importing
             TRAVEL_ID             TYPE /DMO/TRAVEL_ID
          returning value(TRAVEL_WITH_CUSTOMER) TYPE ZABAP_TRAVEL_WITH_CUSTOMER.
    class-methods GET_TRAVELS
          importing
             CUSTOMER_ID             TYPE /DMO/CUSTOMER_ID
          returning value(TRAVELS) TYPE Z11_TRAVELS.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_helper IMPLEMENTATION.

    METHOD GET_TRAVEL_WITH_CUSTOMER.

    SELECT FROM /DMO/TRAVEL
      inner join /DMO/CUSTOMER on /DMO/TRAVEL~CUSTOMER_ID = /DMO/CUSTOMER~CUSTOMER_ID
      FIELDS *
      where travel_id = @travel_id
      into CORRESPONDING FIELDS OF @travel_with_customer.
    ENDSELECT.



      "try.
    "DATA(travel_info) = ZCL_ABAP_HELPER=>GET_TRAVEL( TRAVEL_ID ).
  "catch zcx_abap_NO_DATA into data(x).
      "out->write( x->get_text(  ) ).
    "endtry.

   " try.
    "DATA(customer_info) = ZCL_ABAP_HELPER=>GET_CUSTOMER( CUSTOMER_ID = travel_info-CUSTOMER_ID ).
  "catch zcx_abap_NO_DATA into data(y).
      "out->write( x->get_text(  ) ).
    "endtry.

   " TRAVEL_WITH_CUSTOMER = corresponding #( travel_info ).
   " TRAVEL_WITH_CUSTOMER = corresponding #( base ( TRAVEL_WITH_CUSTOMER ) customer_info ).


    ENDMETHOD.

  METHOD get_travels.


    SELECT FROM /DMO/TRAVEL
      FIELDS *
      WHERE CUSTOMER_ID = @customer_id
      INTO TABLE @travels.


    "try.
        "TRAVELS = ZCL_ABAP_HELPER=>GET_TRAVELS( customer_id = customer_id ).
    "catch zcx_abap_NO_DATA into data(y).
      "out->write( x->get_text(  ) ).
    "endtry.

  ENDMETHOD.

ENDCLASS.
