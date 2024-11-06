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

    "submit to
    DATA lt_values TYPE STANDARD TABLE OF zprauthsubmitto WITH EMPTY KEY.
    DELETE FROM zprauthsubmitto.
    lt_values = VALUE #( ( Role = 'Category Manager' Division = '46' UserId = 'User A' )
                         ( Role = 'Category Manager' Division = '46' UserId = 'User B' )
                         ( Role = 'Category Manager' Division = '46' UserId = 'User C' )
                         ( Role = 'Data Entry' Division = '46' UserId = 'User A' )
                         ( Role = 'Data Entry' Division = '46' UserId = 'User B' )
                         ( Role = 'Data Entry' Division = '46' UserId = 'User C' )
                         ( Role = 'Accounting' Division = '46' UserId = 'User A' )
                         ( Role = 'Accounting' Division = '46' UserId = 'User B' )
                         ( Role = 'Accounting' Division = '46' UserId = 'User C' )
                         ( Role = 'Category Manager' Division = '47' UserId = 'User A' )
                         ( Role = 'Category Manager' Division = '47' UserId = 'User B' )
                         ( Role = 'Category Manager' Division = '47' UserId = 'User C' )
                         ( Role = 'Data Entry' Division = '47' UserId = 'User A' )
                         ( Role = 'Data Entry' Division = '47' UserId = 'User B' )
                         ( Role = 'Data Entry' Division = '47' UserId = 'User C' )
                         ( Role = 'Accounting' Division = '47' UserId = 'User A' )
                         ( Role = 'Accounting' Division = '47' UserId = 'User B' )
                         ( Role = 'Accounting' Division = '47' UserId = 'User C' ) ).
    INSERT zprauthsubmitto FROM TABLE @lt_values.

    "action
    DATA lt_action TYPE STANDARD TABLE OF zprauthaction WITH EMPTY KEY.
    DELETE FROM zprauthaction.
    lt_action = VALUE #( ( Status = 'New' Action = 'Submit to Category Manager' )
                         ( Status = 'Draft' Action = 'Submit to Category Manager' )
                         ( Status = 'Rejected' Action = 'Submit to Category Manager' )
                         ( Status = 'Submitted to Category Manager for Approval' Action = 'Approved by Category Manager' )
                         ( Status = 'Submitted to Category Manager for Approval' Action = 'Rejected by Category Manager' )
                         ( Status = 'Approved by Category Manager' Action = 'Approved and Posted by Accounting' )
                         ( Status = 'Approved by Category Manager' Action = 'Rejected by Accounting' ) ).
    INSERT zprauthaction FROM TABLE @lt_action.
  ENDMETHOD.
ENDCLASS.
