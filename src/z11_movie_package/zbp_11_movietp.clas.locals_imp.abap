CLASS lhc_rating DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS DetermineRatingDate FOR DETERMINE ON SAVE
      IMPORTING keys FOR Rating~DetermineRatingDate.

    METHODS DetermineUserName FOR DETERMINE ON SAVE
      IMPORTING keys FOR Rating~DetermineUserName.

ENDCLASS.

CLASS lhc_rating IMPLEMENTATION.

  METHOD DetermineRatingDate.

  DATA ratings type table for update zr_11_ratingtp.


    LOOP at keys into data(key).
      APPEND value #( %tky = key-%tky ) to ratings.
    endloop.

    modify ENTITIES OF ZR_11_movietp IN LOCAL MODE
      entity Rating
      UPDATE
      fields ( UserName )
      with ratings.

  ENDMETHOD.

  METHOD DetermineUserName.

  DATA ratings type table for update zr_11_ratingTp.


    LOOP at keys into data(key).
      APPEND value #( %tky = key-%tky UserName = sy-uname ) to ratings.
    endloop.

    modify ENTITIES OF ZR_11_movieTP IN LOCAL MODE
      entity Rating
      UPDATE
      fields ( UserName )
      with ratings.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_Movie DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movie RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Movie RESULT result.

    METHODS ValidateGenre FOR VALIDATE ON SAVE
      IMPORTING keys FOR Movie~ValidateGenre.
    METHODS RateMovie FOR MODIFY
      IMPORTING keys FOR ACTION Movie~RateMovie. "RESULT result.

ENDCLASS.

CLASS lhc_Movie IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD ValidateGenre.
    " SELECT FROM      READ ENTITY
    " FIELDS           FIELDS
    " WHERE            WITH
    " INTO             RESULT

    DATA Genres TYPE TABLE FOR READ RESULT zr_11_movietp.
    " DATA failed_travels type RESPONSE for failed zr_11_movietp.

    " Read Movies
    READ ENTITIES OF zr_11_movietp
         ENTITY Movie
         FIELDS ( Genre )
         WITH CORRESPONDING #( keys )
         RESULT Genres.

    " Process Travels

    LOOP AT Genres INTO DATA(Genre).

      " Validate Customer and Create Error Message
      SELECT SINGLE FROM DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name = 'ZABAP_GENRE' )
        FIELDS @abap_true
        WHERE value_low = @Genre-Genre
        INTO @DATA(exists).

      IF exists = abap_false. " IF exists is INITIAL. "IF exists = ''.
        APPEND VALUE #( %tky = Genre-%tky ) TO failed-movie.
        DATA(message) = NEW ZCM_ABAP_MOVIE( textid      = ZCM_ABAP_MOVIE=>no_genre_found
                                           Genre = Genre-Genre
                                           severity    = if_abap_behv_message=>severity-error ).
        APPEND VALUE #( %tky                = genre-%tky
                        %msg                = message
                        %element-Genre = if_abap_behv=>mk-on ) TO reported-movie.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.

  METHOD RateMovie.
    DATA ratings TYPE TABLE FOR CREATE ZR_11_MovieTP\_Ratings.

    DATA(valid_keys) = keys.

    " Process Movie-Keys
    LOOP AT keys INTO DATA(key).
      " Validate Rating
      IF key-%param-Rating >= 1 AND key-%param-Rating <= 10.
        CONTINUE.
      ENDIF.

      " Create Error Message
      DATA(message) = NEW zcm_abap_movie( textid   = zcm_abap_movie=>invalid_rating
                                          rating   = key-%param-Rating
                                          severity = if_abap_behv_message=>severity-error ).
      APPEND VALUE #( %tky              = key-%tky
                      %msg              = message
                      %action-RateMovie = if_abap_behv=>mk-on )
             TO reported-movie.

      APPEND VALUE #( %tky = key-%tky ) TO failed-movie.
      DELETE valid_keys WHERE %tky = key-%tky.
    ENDLOOP.
    " CHeck Movie Keys
    IF valid_keys IS INITIAL.
      RETURN.
    ENDIF.

    " Create Ratings

    LOOP AT valid_keys INTO key.
      APPEND VALUE #( %tky    = key-%tky
                      %target = VALUE #( ( Rating = key-%param-rating ) ) ) TO ratings.
    ENDLOOP.

    MODIFY ENTITIES OF ZR_11_MovieTP IN LOCAL MODE
           ENTITY Movie
           CREATE BY \_Ratings
           AUTO FILL CID
           FIELDS ( Rating )
           WITH ratings.

  ENDMETHOD.

ENDCLASS.
