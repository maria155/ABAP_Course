CLASS zcl_student_ma DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_student,
             student_id TYPE i,
             name       TYPE string,
             age        TYPE i,
             major      TYPE string,
             email      TYPE string,
           END OF ty_student.

    TYPES: ty_student_table TYPE STANDARD TABLE OF ty_student WITH DEFAULT KEY.

    CLASS-DATA: gv_student_unique_id TYPE i VALUE 1,
                gt_students TYPE ty_student_table.

    METHODS:
      create_student
        IMPORTING iv_student_name  TYPE string
                  iv_student_age   TYPE i
                  iv_student_major         TYPE string
                  iv_student_email         TYPE string
        RETURNING VALUE(rv_student_id) TYPE i,

      update_student
        IMPORTING iv_student_id TYPE i
                  iv_name       TYPE string
                  iv_age        TYPE i
                  iv_major      TYPE string
                  iv_email      TYPE string,

      get_student
        IMPORTING iv_student_id TYPE i
        RETURNING VALUE(rs_student) TYPE ty_student,

      get_all_students
        RETURNING VALUE(rt_students) TYPE ty_student_table,

      set_name
        IMPORTING iv_name TYPE string,

      get_name
        RETURNING VALUE(rv_name) TYPE string,

      set_age
        IMPORTING iv_age TYPE i,

      get_age
        RETURNING VALUE(rv_age) TYPE i,

      set_major
        IMPORTING iv_major TYPE string,

      get_major
        RETURNING VALUE(rv_major) TYPE string,

      set_email
        IMPORTING iv_email TYPE string,

      get_email
        RETURNING VALUE(rv_email) TYPE string.

  PRIVATE SECTION.
    DATA: student_id    TYPE i,
          university_id    TYPE i,
          name  TYPE string,
          age   TYPE i,
          major TYPE string,
          email TYPE string.

ENDCLASS.

CLASS zcl_student_ma IMPLEMENTATION.

  METHOD set_name.
    name = iv_name.
  ENDMETHOD.

  METHOD get_name.
    rv_name = name.
  ENDMETHOD.

  METHOD set_age.
    age = iv_age.
  ENDMETHOD.

  METHOD get_age.
    rv_age = age.
  ENDMETHOD.

  METHOD set_major.
    major = iv_major.
  ENDMETHOD.

  METHOD get_major.
    rv_major = major.
  ENDMETHOD.

  METHOD set_email.
    email = iv_email.
  ENDMETHOD.

  METHOD get_email.
    rv_email = email.
  ENDMETHOD.

  METHOD get_student.
    CLEAR rs_student.
    LOOP AT gt_students INTO rs_student WHERE student_id = iv_student_id.
     EXIT.
    ENDLOOP.
ENDMETHOD.

  METHOD get_all_students.
    rt_students = gt_students.
  ENDMETHOD.

  METHOD create_student.

    student_id = gv_student_unique_id.

    me->set_name( iv_name = iv_student_name ).
    me->set_age( iv_age = iv_student_age ).
    me->set_major( iv_major = iv_student_major ).
    me->set_email( iv_email = iv_student_email ).

    DATA(ls_student) = VALUE ty_student(
      student_id = student_id
      name       = me->get_name( )
      age        = me->get_age( )
      major      = me->get_major( )
      email      = me->get_email( ) ).

    APPEND ls_student TO gt_students.

    rv_student_id = student_id.
    gv_student_unique_id += 1.
  ENDMETHOD.

  METHOD update_student.
    LOOP AT gt_students ASSIGNING FIELD-SYMBOL(<fs_student>)
      WHERE student_id = iv_student_id.
      <fs_student>-name  = iv_name.
      <fs_student>-age   = iv_age.
      <fs_student>-major = iv_major.
      <fs_student>-email = iv_email.
      EXIT.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

