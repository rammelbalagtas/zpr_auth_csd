CLASS zcl_prauth_submitto_vh DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_prauth_submitto_vh IMPLEMENTATION.


  METHOD if_rap_query_provider~select.

    DATA(lt_sort) = io_request->get_sort_elements( ).
    DATA(ld_offset) = io_request->get_paging( )->get_offset( ).
    DATA(ld_page_size) = io_request->get_paging( )->get_page_size( ).
    TRY.
        DATA(lt_filter) = io_request->get_filter( )->get_as_ranges( ).
      CATCH cx_rap_query_filter_no_range.
        CLEAR lt_filter.
    ENDTRY.

    LOOP AT lt_filter INTO DATA(ls_filter).
      READ TABLE ls_filter-range INTO DATA(ls_range) INDEX 1.
      DATA(lv_value) = ls_range-low.
      CASE ls_filter-name.
        WHEN 'DIVISION'.
          DATA(lv_division) = lv_value.
        WHEN 'STATUS'.
          DATA(lv_status) = lv_value.
        WHEN 'SUBMITTEDBY'.
          DATA(lv_submittedby) = lv_value.
        WHEN 'SUBMITTEDTO'.
          DATA(lv_submittedto) = lv_value.
      ENDCASE.
      CLEAR: lv_value, ls_range.
    ENDLOOP.

    DATA lt_values TYPE STANDARD TABLE OF zprauth_i_submittovh WITH EMPTY KEY.

    IF lv_division IS INITIAL OR lv_submittedby IS INITIAL.
      CLEAR lt_values[].
    ELSE.
      IF lv_status IS INITIAL OR lv_status EQ 'New' OR lv_status EQ 'Draft' OR lv_status EQ 'Rejected by Category Manager' OR lv_status EQ 'Rejected by Accounting'.
        DATA(lv_role) = 'Category Manager'.
      ELSEIF lv_status EQ 'Submitted to Category Manager for Approval'.
        lv_role = 'Accounting'.
      ENDIF.
    ENDIF.

    SELECT userid FROM zprauthsubmitto WHERE role = @lv_role AND division = @lv_division INTO TABLE @DATA(lt_users).
    DELETE lt_users WHERE userid = lv_submittedby.
    IF lv_submittedto IS NOT INITIAL.
       DELETE lt_users WHERE userid = lv_submittedto.
    ENDIF.
    lt_values = VALUE #( FOR user in lt_users ( userid = user-userid ) ).

    IF io_request->is_data_requested( ).
      io_response->set_data( lt_values ).
    ENDIF.

    IF io_request->is_total_numb_of_rec_requested( ).
      io_response->set_total_number_of_records( lines( lt_values ) ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
