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

* testing for date_parsing
      out->write( zif_abap_course_basics~date_parsing( '12 May 2017' ) ).

* testing for scrabble_score
      out->write( zif_abap_course_basics~scrabble_score( 'AbCEz' ) ).

* testing for get_current_date_time
      out->write( zif_abap_course_basics~get_current_date_time( ) ).
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
    DATA: lt_string_parts TYPE STANDARD TABLE OF string WITH EMPTY KEY,
          lv_day          TYPE i,
          lv_month        TYPE i,
          lv_year         TYPE i.

    SPLIT iv_date AT space INTO TABLE lt_string_parts.

    IF lines( lt_string_parts ) <> 3.
      RAISE EXCEPTION TYPE cx_sy_conversion_no_number.
    ENDIF.

    READ TABLE lt_string_parts INDEX 1 INTO DATA(lv_day_string).
    READ TABLE lt_string_parts INDEX 2 INTO DATA(lv_month_string).
    READ TABLE lt_string_parts INDEX 3 INTO DATA(lv_year_string).

    lv_day = lv_day_string.
    lv_year = lv_year_string.

    TRY.
        lv_month = lv_month_string.
      CATCH cx_sy_conversion_no_number.
        CASE to_upper( lv_month_string ).
          WHEN 'JANUARY'.   lv_month = 1.
          WHEN 'FEBRUARY'.  lv_month = 2.
          WHEN 'MARCH'.     lv_month = 3.
          WHEN 'APRIL'.     lv_month = 4.
          WHEN 'MAY'.       lv_month = 5.
          WHEN 'JUNE'.      lv_month = 6.
          WHEN 'JULY'.      lv_month = 7.
          WHEN 'AUGUST'.    lv_month = 8.
          WHEN 'SEPTEMBER'. lv_month = 9.
          WHEN 'OCTOBER'.   lv_month = 10.
          WHEN 'NOVEMBER'.  lv_month = 11.
          WHEN 'DECEMBER'.  lv_month = 12.
          WHEN OTHERS.
            RAISE EXCEPTION TYPE cx_sy_conversion_no_number.
        ENDCASE.
    ENDTRY.

    rv_result = lv_year && lv_day && lv_month.

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
    GET TIME STAMP FIELD DATA(lv_timestamp).
    rv_result = lv_timestamp.
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
    DATA: lv_letter TYPE c LENGTH 1,
          lv_score  TYPE i VALUE 0,
          lv_tmp_word TYPE string,
          lv_index  TYPE i.

    lv_tmp_word = iv_word.
    TRANSLATE lv_tmp_word TO UPPER CASE.

    DO strlen( lv_tmp_word ) TIMES.
      lv_index = sy-index - 1.
      lv_letter = lv_tmp_word+lv_index(1).

    CASE lv_letter.                         " I had a problem with casting so I did it in this way
      WHEN 'A'. lv_score = lv_score + 1.
      WHEN 'B'. lv_score = lv_score + 2.
      WHEN 'C'. lv_score = lv_score + 3.
      WHEN 'D'. lv_score = lv_score + 4.
      WHEN 'E'. lv_score = lv_score + 5.
      WHEN 'F'. lv_score = lv_score + 6.
      WHEN 'G'. lv_score = lv_score + 7.
      WHEN 'H'. lv_score = lv_score + 8.
      WHEN 'I'. lv_score = lv_score + 9.
      WHEN 'J'. lv_score = lv_score + 10.
      WHEN 'K'. lv_score = lv_score + 11.
      WHEN 'L'. lv_score = lv_score + 12.
      WHEN 'M'. lv_score = lv_score + 13.
      WHEN 'N'. lv_score = lv_score + 14.
      WHEN 'O'. lv_score = lv_score + 15.
      WHEN 'P'. lv_score = lv_score + 16.
      WHEN 'Q'. lv_score = lv_score + 17.
      WHEN 'R'. lv_score = lv_score + 18.
      WHEN 'S'. lv_score = lv_score + 19.
      WHEN 'T'. lv_score = lv_score + 20.
      WHEN 'U'. lv_score = lv_score + 21.
      WHEN 'V'. lv_score = lv_score + 22.
      WHEN 'W'. lv_score = lv_score + 23.
      WHEN 'X'. lv_score = lv_score + 24.
      WHEN 'Y'. lv_score = lv_score + 25.
      WHEN 'Z'. lv_score = lv_score + 26.
      WHEN OTHERS.
        RAISE EXCEPTION TYPE cx_sy_conversion_no_number.
    ENDCASE.
  ENDDO.

    rv_result = lv_score.

  ENDMETHOD.

ENDCLASS.
