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

* testing for calculator
      DATA(first_number) = 2.
      DATA(second_number) = 8.
      DATA(operator) = '-'.

      DATA(lv_result) = zif_abap_course_basics~calculator(
        iv_first_number = first_number
        iv_second_number = second_number
        iv_operator = operator
      ).

      DATA lv_message TYPE string.

      IF operator = '/' AND second_number = 0.
        lv_message = 'You cannot divide a number by 0!'.

      ELSE.
        lv_message = |{ first_number } { operator } { second_number } = { lv_result }|.

      ENDIF.

      out->write( lv_message ).

* testing for fizz_buzz
      out->write( zif_abap_course_basics~fizz_buzz( ) ).
  ENDMETHOD.


  METHOD zif_abap_course_basics~calculator.
    CASE iv_operator.
        WHEN '+'.
            rv_result = iv_first_number + iv_second_number.
        WHEN '-'.
            rv_result = iv_first_number - iv_second_number.
        WHEN '*'.
            rv_result = iv_first_number * iv_second_number.
        WHEN '/'.
            IF iv_second_number = 0.
                rv_result = 0.
            ELSE.
                rv_result = iv_first_number / iv_second_number. " we are doing integer division
            ENDIF.

    ENDCASE.
  ENDMETHOD.


  METHOD zif_abap_course_basics~date_parsing.
  ENDMETHOD.


  METHOD zif_abap_course_basics~fizz_buzz.
    DATA number TYPE i.
    number = 1.
    rv_result = ''.

    DO 100 TIMES.
    DATA lv_text TYPE string.

    IF number MOD 3 = 0 AND number MOD 5 = 0.
        lv_text = 'FizzBuzz'.
    ELSEIF number MOD 5 = 0.
        lv_text = 'Buzz'.
    ELSEIF number MOD 3 = 0.
        lv_text = 'Fizz'.
    ELSE.
        lv_text = number.
    ENDIF.

    rv_result = |{ rv_result } { lv_text }|.
    number = number + 1.
    ENDDO.

    rv_result = condense( rv_result ).

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
