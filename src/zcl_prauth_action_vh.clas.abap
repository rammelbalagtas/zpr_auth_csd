CLASS zcl_prauth_action_vh DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PRAUTH_ACTION_VH IMPLEMENTATION.


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
        WHEN 'STATUS'.
          DATA(lv_status) = lv_value.
        WHEN 'SUBMITTEDBY'.
          DATA(lv_submittedby) = lv_value.
      ENDCASE.
      CLEAR: lv_value, ls_range.
    ENDLOOP.

    DATA lt_values TYPE STANDARD TABLE OF zprauth_i_actionvh WITH EMPTY KEY.

    SELECT action FROM zprauthaction WHERE status = @lv_status INTO TABLE @DATA(lt_action).
    lt_values = VALUE #( FOR action IN lt_action ( action = action-action ) ).

    IF io_request->is_data_requested( ).
      io_response->set_data( lt_values ).
    ENDIF.

    IF io_request->is_total_numb_of_rec_requested( ).
      io_response->set_total_number_of_records( lines( lt_values ) ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
