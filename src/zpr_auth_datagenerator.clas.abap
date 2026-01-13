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

    "Components
    DATA lt_material TYPE STANDARD TABLE OF zpr_csd_mat.
    DELETE FROM zpr_csd_mat.
    lt_material = VALUE #( ( salesorg = 'PCI' DistChannel = '04' Division = '46' Material = 'COMPONENT1' Description = 'Component 1'
                             gpzprcurr = '10.0'
                             zp1curr   = '10.0'
                             zgocurr   = '10.0'
                             zpxcurr   = '10.0'
                             zpr02curr = '10.0'
                             zpr03curr = '10.0'
                             zpr04curr = '10.0'
                             zpr05curr = '10.0'
                             zpr06curr = '10.0'
                             zpr07curr = '10.0'
                             zpr08curr = '10.0'
                             zpr09curr = '10.0'
                             zpr10curr = '10.0'
                             zpr11curr = '10.0'
                             zpr12curr = '10.0'
                             zpr13curr = '10.0'
                             zpr14curr = '10.0'
                             zpr15curr = '10.0' )
                          ( salesorg = 'PCI' DistChannel = '04' Division = '46' Material = 'COMPONENT2' Description = 'Component 2'
                             gpzprcurr = '20.0'
                             zp1curr   = '20.0'
                             zgocurr   = '20.0'
                             zpxcurr   = '20.0'
                             zpr02curr = '20.0'
                             zpr03curr = '20.0'
                             zpr04curr = '20.0'
                             zpr05curr = '20.0'
                             zpr06curr = '20.0'
                             zpr07curr = '20.0'
                             zpr08curr = '20.0'
                             zpr09curr = '20.0'
                             zpr10curr = '20.0'
                             zpr11curr = '20.0'
                             zpr12curr = '20.0'
                             zpr13curr = '20.0'
                             zpr14curr = '20.0'
                             zpr15curr = '20.0' )
                           ( salesorg = 'PCI' DistChannel = '04' Division = '46' Material = 'COMPONENT3' Description = 'Component 3'
                             gpzprcurr = '30.0'
                             zp1curr   = '30.0'
                             zgocurr   = '30.0'
                             zpxcurr   = '30.0'
                             zpr02curr = '30.0'
                             zpr03curr = '30.0'
                             zpr04curr = '30.0'
                             zpr05curr = '30.0'
                             zpr06curr = '30.0'
                             zpr07curr = '30.0'
                             zpr08curr = '30.0'
                             zpr09curr = '30.0'
                             zpr10curr = '30.0'
                             zpr11curr = '30.0'
                             zpr12curr = '30.0'
                             zpr13curr = '30.0'
                             zpr14curr = '30.0'
                             zpr15curr = '30.0' )
                           ( salesorg = 'PCI' DistChannel = '04' Division = '46' Material = 'COMPONENT4' Description = 'Component 4'
                             gpzprcurr = '40.0'
                             zp1curr   = '40.0'
                             zgocurr   = '40.0'
                             zpxcurr   = '40.0'
                             zpr02curr = '40.0'
                             zpr03curr = '40.0'
                             zpr04curr = '40.0'
                             zpr05curr = '40.0'
                             zpr06curr = '40.0'
                             zpr07curr = '40.0'
                             zpr08curr = '40.0'
                             zpr09curr = '40.0'
                             zpr10curr = '40.0'
                             zpr11curr = '40.0'
                             zpr12curr = '40.0'
                             zpr13curr = '40.0'
                             zpr14curr = '40.0'
                             zpr15curr = '40.0' )
                           ( salesorg = 'PCI' DistChannel = '04' Division = '46' Material = 'CONFIG1' Description = 'Config 1' Config = 'X'
                             gpzprcurr = '30.0'
                             zp1curr   = '30.0'
                             zgocurr   = '30.0'
                             zpxcurr   = '30.0'
                             zpr02curr = '30.0'
                             zpr03curr = '30.0'
                             zpr04curr = '30.0'
                             zpr05curr = '30.0'
                             zpr06curr = '30.0'
                             zpr07curr = '30.0'
                             zpr08curr = '30.0'
                             zpr09curr = '30.0'
                             zpr10curr = '30.0'
                             zpr11curr = '30.0'
                             zpr12curr = '30.0'
                             zpr13curr = '30.0'
                             zpr14curr = '30.0'
                             zpr15curr = '30.0' )
                           ( salesorg = 'PCI' DistChannel = '04' Division = '46' Material = 'CONFIG2' Description = 'Config 2' Config = 'X'
                             gpzprcurr = '50.0'
                             zp1curr   = '50.0'
                             zgocurr   = '50.0'
                             zpxcurr   = '50.0'
                             zpr02curr = '50.0'
                             zpr03curr = '50.0'
                             zpr04curr = '50.0'
                             zpr05curr = '50.0'
                             zpr06curr = '50.0'
                             zpr07curr = '50.0'
                             zpr08curr = '50.0'
                             zpr09curr = '50.0'
                             zpr10curr = '50.0'
                             zpr11curr = '50.0'
                             zpr12curr = '50.0'
                             zpr13curr = '50.0'
                             zpr14curr = '50.0'
                             zpr15curr = '50.0' )
                           ( salesorg = 'PCI' DistChannel = '04' Division = '47' Material = 'COMPONENT 11' Description = 'Component 11'
                             gpzprcurr = '70.0'
                             zp1curr   = '70.0'
                             zgocurr   = '70.0'
                             zpxcurr   = '70.0'
                             zpr02curr = '70.0'
                             zpr03curr = '70.0'
                             zpr04curr = '70.0'
                             zpr05curr = '70.0'
                             zpr06curr = '70.0'
                             zpr07curr = '70.0'
                             zpr08curr = '70.0'
                             zpr09curr = '70.0'
                             zpr10curr = '70.0'
                             zpr11curr = '70.0'
                             zpr12curr = '70.0'
                             zpr13curr = '70.0'
                             zpr14curr = '70.0'
                             zpr15curr = '70.0' ) ).
    INSERT zpr_csd_mat FROM TABLE @lt_material.

    "impacted finished goods
    DATA lt_impfg TYPE STANDARD TABLE OF zpr_impfg WITH EMPTY KEY.
    DELETE FROM zpr_impfg.
    lt_impfg = VALUE #( ( configmat = 'CONFIG1' material = 'COMPONENT1' )
                        ( configmat = 'CONFIG1' material = 'COMPONENT2' )
                        ( configmat = 'CONFIG2' material = 'COMPONENT2' )
                        ( configmat = 'CONFIG2' material = 'COMPONENT3' ) ).
    INSERT zpr_impfg FROM TABLE @lt_impfg.

    "division
    DATA lt_div TYPE STANDARD TABLE OF zcsddivision WITH EMPTY KEY.
    DELETE FROM zcsddivision.
    lt_div = VALUE #( ( division = '46' description = '46' )
                      ( division = '47' description = '47' ) ).
    INSERT zcsddivision FROM TABLE @lt_div.

  ENDMETHOD.
ENDCLASS.
