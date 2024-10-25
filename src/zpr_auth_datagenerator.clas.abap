CLASS zpr_auth_datagenerator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zpr_auth_datagenerator IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DELETE FROM zpr_auth2_item.
  ENDMETHOD.
ENDCLASS.
