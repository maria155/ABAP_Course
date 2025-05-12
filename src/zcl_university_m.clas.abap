CLASS zcl_university_m DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_university,
             id       TYPE i,
             name     TYPE string,
             location TYPE string,
           END OF ty_university.

    TYPES: ty_student_table TYPE STANDARD TABLE OF zcl_student_ma=>ty_student WITH DEFAULT KEY.

    CLASS-DATA: gv_uni_unique_id TYPE i VALUE 1.

    METHODS: create_university
               IMPORTING iv_university_name     TYPE string
                         iv_university_location TYPE string
               RETURNING VALUE(rv_university_id) TYPE i,

               add_student
               IMPORTING iv_student_name TYPE string
                         iv_student_age TYPE i
                         iv_student_major TYPE string
                         iv_student_email TYPE string
                         iv_student_id TYPE i,

               delete_student
               IMPORTING iv_student_id TYPE i,

               list_students
               RETURNING VALUE(rt_students) TYPE ty_student_table,

               set_university_name
               IMPORTING iv_name TYPE string,

               get_university_name
               RETURNING VALUE(rv_name) TYPE string,

               set_university_location
               IMPORTING iv_location TYPE string,

               get_university_location
               RETURNING VALUE(rv_location) TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA: id TYPE i,
          name TYPE string,
          location TYPE string,
          students TYPE ty_student_table.

ENDCLASS.

CLASS zcl_university_m IMPLEMENTATION.

  METHOD set_university_name.
    name = iv_name.
  ENDMETHOD.

  METHOD get_university_name.
    rv_name = name.
  ENDMETHOD.

  METHOD set_university_location.
    location = iv_location.
  ENDMETHOD.

  METHOD get_university_location.
    rv_location = location.
  ENDMETHOD.

  METHOD create_university.
    id = gv_uni_unique_id.
    gv_uni_unique_id = gv_uni_unique_id + 1.

    set_university_name( iv_name = iv_university_name ).
    set_university_location( iv_location = iv_university_location ).

    rv_university_id = gv_uni_unique_id.
  ENDMETHOD.

  METHOD add_student.
    DATA(new_student) = VALUE zcl_student_ma=>ty_student(
                        student_id = iv_student_id
                        university_id = id                " The student gets the id of the university where they are studying
                        name       = iv_student_name
                        age        = iv_student_age
                        major      = iv_student_major
                        email      = iv_student_email
                      ).

    APPEND new_student TO students.
  ENDMETHOD.

  METHOD delete_student.
    DELETE students WHERE student_id = iv_student_id.
  ENDMETHOD.

  METHOD list_students.
    rt_students = students.
  ENDMETHOD.

ENDCLASS.

