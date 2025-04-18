CLASS zcl_dfv_abap_course_basics_m DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    INTERFACES zif_abap_course_basics .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dfv_abap_course_basics_m IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
* testing for hello_world
    out->write( zif_abap_course_basics~hello_world( 'Maria' ) ).
  ENDMETHOD.

  METHOD zif_abap_course_basics~calculator.
  ENDMETHOD.


  METHOD zif_abap_course_basics~date_parsing.
  ENDMETHOD.


  METHOD zif_abap_course_basics~fizz_buzz.
  ENDMETHOD.


  METHOD zif_abap_course_basics~get_current_date_time.
  ENDMETHOD.


  METHOD zif_abap_course_basics~hello_world.
    DATA lv_message TYPE string.
    lv_message = |Hello { iv_name }, your system user is { sy-uname }.|.
    rv_result = lv_message.
  ENDMETHOD.

  METHOD zif_abap_course_basics~internal_tables.
  ENDMETHOD.


  METHOD zif_abap_course_basics~open_sql.
  ENDMETHOD.


  METHOD zif_abap_course_basics~scrabble_score.
  ENDMETHOD.
ENDCLASS.
