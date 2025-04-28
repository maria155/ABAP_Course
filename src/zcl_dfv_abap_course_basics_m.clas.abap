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

  " Read day, month, year
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

    DATA lv_space TYPE string.
    lv_space = ''.
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
