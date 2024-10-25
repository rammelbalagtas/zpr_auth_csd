CLASS lhc_items DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS onSelectMaterial FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Items~onSelectMaterial.

ENDCLASS.

CLASS lhc_items IMPLEMENTATION.

  METHOD onSelectMaterial.

    DATA lr_material TYPE RANGE OF zmatnr.
    READ ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
        ENTITY Items
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(lt_item).

    SELECT * FROM zpr_csd_mat FOR ALL ENTRIES IN @lt_item WHERE material = @lt_item-material INTO TABLE @DATA(lt_material).

    LOOP AT lt_item ASSIGNING FIELD-SYMBOL(<fs_item>).
      READ TABLE lt_material INTO DATA(ls_material) WITH KEY material = <fs_item>-material.
      IF sy-subrc EQ 0.
        MOVE-CORRESPONDING ls_material TO <fs_item>.
        APPEND INITIAL LINE TO lr_material ASSIGNING FIELD-SYMBOL(<fs_material>).
        <fs_material>-sign = 'I'.
        <fs_material>-option = 'EQ'.
        <fs_material>-low = ls_material-material.
      ENDIF.
    ENDLOOP.

    IF lr_material IS NOT INITIAL.
      MODIFY ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
         ENTITY Items
           UPDATE
             FIELDS (   Zp1Curr
                        ZgoCurr
                        ZpxCurr
                        Zpr02Curr
                        Zpr03Curr
                        Zpr04Curr
                        Zpr05Curr
                        Zpr06Curr
                        Zpr07Curr
                        Zpr08Curr
                        Zpr09Curr
                        Zpr10Curr
                        Zpr11Curr
                        Zpr12Curr
                        Zpr13Curr
                        Zpr14Curr
                        Zpr15Curr )
             WITH VALUE #( FOR item IN lt_item
                             ( %tky    = item-%tky
                               Zp1Curr = item-Zp1Curr
                               ZgoCurr = item-ZgoCurr
                               ZpxCurr = item-ZpxCurr
                               Zpr02Curr = item-Zpr02Curr
                               Zpr03Curr = item-Zpr03Curr
                               Zpr04Curr = item-Zpr04Curr
                               Zpr05Curr = item-Zpr05Curr
                               Zpr06Curr = item-Zpr06Curr
                               Zpr07Curr = item-Zpr07Curr
                               Zpr08Curr = item-Zpr08Curr
                               Zpr09Curr = item-Zpr09Curr
                               Zpr10Curr = item-Zpr10Curr
                               Zpr11Curr = item-Zpr11Curr
                               Zpr12Curr = item-Zpr12Curr
                               Zpr13Curr = item-Zpr13Curr
                               Zpr14Curr = item-Zpr14Curr
                               Zpr15Curr = item-Zpr15Curr
                              ) )
         MAPPED DATA(upd_mapped)
         FAILED DATA(upd_failed)
         REPORTED DATA(upd_reported).

*      SELECT * FROM zpr_impfg WHERE material IN @lr_material INTO TABLE @DATA(lt_config).
*      IF sy-subrc EQ 0.
*        SORT lt_config BY configmat ASCENDING.
*        DELETE ADJACENT DUPLICATES FROM lt_config COMPARING configmat.
*        DATA lt_impactedfg_new TYPE TABLE FOR CREATE zr_pr_auth2_head\_ImpactedGoods.
*        READ TABLE keys INTO DATA(ls_key) INDEX 1.
*        lt_impactedfg_new = VALUE #( (  %is_draft = ls_key-%is_draft
*                                        PriceAuth = ls_key-PriceAuth
*                                        %target   = VALUE #( FOR config IN lt_config (  %is_draft = ls_key-%is_draft
*                                                                                        PriceAuth = ls_key-PriceAuth
*                                                                                        Material  = config-configmat
*                                                                                        ZP1New = 10
*                                                                                        ZPXNew = 10
*                                                                                        ZGoNew = 10
*                                                                                        %control = VALUE #( PriceAuth   = if_abap_behv=>mk-on
*                                                                                                            Material    = if_abap_behv=>mk-on
*                                                                                                            ZP1New      = if_abap_behv=>mk-on
*                                                                                                            ZPXNew      = if_abap_behv=>mk-on
*                                                                                                            ZGoNew      = if_abap_behv=>mk-on ) ) ) ) ).
*      ENDIF.
*
*      READ ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
*      ENTITY Header
*      BY \_ImpactedGoods
*      ALL FIELDS WITH
*      CORRESPONDING #( keys )
*      RESULT DATA(lt_impactedfg_current).
*
*      "Delete already existing entries from child entity
*      MODIFY ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
*      ENTITY ImpactedGoods
*      DELETE FROM VALUE #( FOR ls_impactedfg IN lt_impactedfg_current (  %is_draft = ls_impactedfg-%is_draft
*                                                                             %key  = ls_impactedfg-%key ) )
*      MAPPED DATA(lt_mapped_delete)
*      REPORTED DATA(lt_reported_delete)
*      FAILED DATA(lt_failed_delete).
*
*      "Create records from newly extract data
*      MODIFY ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
*      ENTITY Header
*      CREATE BY \_ImpactedGoods
*      AUTO FILL CID
*      WITH lt_impactedfg_new
*      MAPPED DATA(lt_item_mapped)
*      REPORTED DATA(lt_item_reported)
*      FAILED DATA(lt_item_failed).

    ENDIF.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Header RESULT result.
    METHODS exportfile FOR MODIFY
      IMPORTING keys FOR ACTION header~exportfile RESULT result.

    METHODS importfile FOR MODIFY
      IMPORTING keys FOR ACTION header~importfile RESULT result.

    METHODS submit FOR MODIFY
      IMPORTING keys FOR ACTION header~submit RESULT result.

    METHODS validateentries FOR MODIFY
      IMPORTING keys FOR ACTION header~validateentries.
    METHODS setdefaultvalues FOR DETERMINE ON MODIFY
      IMPORTING keys FOR header~setdefaultvalues.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE Header.

    METHODS populate_impactedgoods.

ENDCLASS.

CLASS lhc_Header IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.
    DATA:
      entity        TYPE STRUCTURE FOR CREATE zr_pr_auth2_head,
      priceauth_max TYPE n LENGTH 10.

    " Ensure PR Auth ID is not set yet (idempotent)- must be checked when BO is draft-enabled
    LOOP AT entities INTO entity WHERE priceauth IS NOT INITIAL.
      APPEND CORRESPONDING #( entity ) TO mapped-header.
    ENDLOOP.

    DATA(entities_wo_id) = entities.
    DELETE entities_wo_id WHERE priceauth IS NOT INITIAL.

    " Get Numbers
    TRY.
        cl_numberrange_runtime=>number_get(
          EXPORTING
            nr_range_nr       = '01'
            object            = '/DMO/TRV_M'
            quantity          = CONV #( lines( entities_wo_id ) )
          IMPORTING
            number            = DATA(number_range_key)
            returncode        = DATA(number_range_return_code)
            returned_quantity = DATA(number_range_returned_quantity)
        ).
      CATCH cx_number_ranges INTO DATA(lx_number_ranges).
        LOOP AT entities_wo_id INTO entity.
          APPEND VALUE #(  %cid = entity-%cid
                           %key = entity-%key
                           %msg = lx_number_ranges
                        ) TO reported-header.
          APPEND VALUE #(  %cid = entity-%cid
                           %key = entity-%key
                        ) TO failed-header.
        ENDLOOP.
        EXIT.
    ENDTRY.

    priceauth_max = number_range_key - number_range_returned_quantity.

    " Set Price Authorization ID
    LOOP AT entities_wo_id INTO entity.
      priceauth_max += 1.
      entity-priceauth = priceauth_max .

      APPEND VALUE #( %cid  = entity-%cid
*                      %key  = entity-%key
                      priceauth = priceauth_max
                      %is_draft = if_abap_behv=>mk-on
                    ) TO mapped-header.
    ENDLOOP.
  ENDMETHOD.

  METHOD exportFile.

    TYPES:
      BEGIN OF ty_excel,
        material TYPE c LENGTH 18,
      END OF ty_excel.

    DATA lt_excel TYPE STANDARD TABLE OF ty_excel.
    DATA ls_excel LIKE LINE OF lt_excel.

    READ ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
      ENTITY Header
         ALL FIELDS
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_header)
      ENTITY Header BY \_Items
        ALL FIELDS
      WITH CORRESPONDING #(  keys  )
      RESULT DATA(lt_item).

    LOOP AT lt_item INTO DATA(ls_item).
      ls_excel-material = ls_item-material.
      APPEND ls_excel TO lt_excel.
    ENDLOOP.

    IF lt_excel IS INITIAL.
      ls_excel-material = 'Sample file'.
      APPEND ls_excel TO lt_excel.
    ENDIF.

    DATA(lo_xlsx) = xco_cp_xlsx=>document->empty( )->write_access(  ).
    DATA(lo_worksheet) = lo_xlsx->get_workbook( )->worksheet->at_position( 1 ).

    DATA(lv_count) = lines( lt_excel ).
    IF lv_count IS INITIAL.
      lv_count = 1.
    ENDIF.
    "from and to is required for performance purposes
    DATA(lo_selection_pattern) = xco_cp_xlsx_selection=>pattern_builder->simple_from_to(
    )->from_column( xco_cp_xlsx=>coordinate->for_alphabetic_value( 'A' )
    )->from_row( xco_cp_xlsx=>coordinate->for_numeric_value( 1 )
    )->to_column( xco_cp_xlsx=>coordinate->for_alphabetic_value( 'B' )
    )->to_row( xco_cp_xlsx=>coordinate->for_numeric_value( lv_count )
    )->get_pattern( ).

    "Write rows of internal table it_data to worksheet
    lo_worksheet->select( lo_selection_pattern
    )->row_stream(
    )->operation->write_from( REF #( lt_excel )
    )->set_value_transformation( xco_cp_xlsx_write_access=>value_transformation->best_effort
    )->execute( ).

    DATA(lv_file_content) = lo_xlsx->get_file_content( ).

    MODIFY ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
     ENTITY Header
       UPDATE
         FIELDS ( AttachmentDownload MimeTypeDownload FilenameDownload )
        WITH VALUE #( FOR header IN lt_header
                         ( %tky             = header-%tky
                           AttachmentDownload = lv_file_content
                           MimeTypeDownload = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
                           FilenameDownload = 'Sample export file.xlsx'
                           %control-AttachmentDownload  = if_abap_behv=>mk-on
                           %control-MimeTypeDownload  = if_abap_behv=>mk-on
                           %control-FilenameDownload  = if_abap_behv=>mk-on ) )
     MAPPED mapped
     FAILED failed
     REPORTED reported.

    READ ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
       ENTITY Header
          ALL FIELDS
       WITH CORRESPONDING #( keys )
       RESULT lt_header.

    result = VALUE #( FOR header IN lt_header
                        ( %tky   = header-%tky
                          %param = header ) ).

    IF failed-header IS INITIAL.
      APPEND VALUE #( %msg = new_message_with_text( severity = if_abap_behv_message=>severity-success
                                                        text = 'Export file has been generated.' )

                    ) TO reported-header.
    ENDIF.

  ENDMETHOD.

  METHOD importFile.
    TYPES: BEGIN OF ty_excel,
             material TYPE string,
             Zp1New   TYPE int4,
             ZGoNew   TYPE int4,
             ZPxNew   TYPE int4,
           END OF ty_excel,
           tt_row TYPE STANDARD TABLE OF ty_excel.
    DATA lt_rows TYPE tt_row.

    READ ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
          ENTITY Header
          ALL FIELDS WITH
          CORRESPONDING #( keys )
          RESULT DATA(lt_header).

    LOOP AT lt_header INTO DATA(ls_header).
      APPEND VALUE #(  %tky        = ls_header-%tky
                       %state_area = 'CHECK_FILE'
                    ) TO reported-header.

      IF ls_header-attachmentUpload IS INITIAL.
        APPEND VALUE #( %tky = ls_header-%tky ) TO failed-header.
        APPEND VALUE #( %tky = ls_header-%tky
                        %state_area         = 'CHECK_FILE'
                        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                          text = 'Upload a file for import' )

                        %element-filenameUpload   = if_abap_behv=>mk-on
                       ) TO reported-header.
        RETURN.
      ENDIF.
    ENDLOOP.

    "Read upload file
    DATA(lv_attachment) = lt_header[ 1 ]-AttachmentUpload.
    DATA(lo_xlsx) = xco_cp_xlsx=>document->for_file_content( iv_file_content = lv_attachment )->read_access( ).
    DATA(lo_worksheet) = lo_xlsx->get_workbook( )->worksheet->at_position( 1 ).

    DATA(lo_selection_pattern) = xco_cp_xlsx_selection=>pattern_builder->simple_from_to( )->get_pattern( ).

    DATA(lo_execute) = lo_worksheet->select( lo_selection_pattern
      )->row_stream(
      )->operation->write_to( REF #( lt_rows ) ).

    lo_execute->set_value_transformation( xco_cp_xlsx_read_access=>value_transformation->string_value
               )->if_xco_xlsx_ra_operation~execute( ).
    "add materials
    DATA lt_material TYPE TABLE FOR CREATE zr_pr_auth2_head\_Items.
    lt_material = VALUE #( FOR ls_key IN keys (
                              %is_draft = ls_key-%is_draft
                              PriceAuth = ls_key-PriceAuth
                              %target   = VALUE #( FOR ls_row IN lt_rows (
                                                                            %is_draft = ls_key-%is_draft
                                                                            PriceAuth = ls_key-PriceAuth
                                                                            Material = ls_row-Material
                                                                            ZP1New = ls_row-ZP1New
                                                                            ZPXNew = ls_row-ZPXNew
                                                                            ZGoNew = ls_row-ZGoNew
                                                                            %control = VALUE #( PriceAuth   = if_abap_behv=>mk-on
                                                                                                Material    = if_abap_behv=>mk-on
                                                                                                ZP1New      = if_abap_behv=>mk-on
                                                                                                ZPXNew      = if_abap_behv=>mk-on
                                                                                                ZGoNew      = if_abap_behv=>mk-on ) ) ) ) ).

    ">>> Start: Refresh and populate items entity
    READ ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
        ENTITY Header
        BY \_Items
        ALL FIELDS WITH
        CORRESPONDING #( keys )
        RESULT DATA(lt_item).

    "Delete already existing entries from child entity
    MODIFY ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
    ENTITY Items
    DELETE FROM VALUE #( FOR ls_item IN lt_item (  %is_draft = ls_item-%is_draft
                                                       %key  = ls_item-%key ) )
    MAPPED DATA(lt_mapped_delete)
    REPORTED DATA(lt_reported_delete)
    FAILED DATA(lt_failed_delete).

    "Create records from newly extract data
    MODIFY ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
    ENTITY Header
    CREATE BY \_Items
    AUTO FILL CID
    WITH lt_material
    MAPPED DATA(lt_item_mapped)
    REPORTED DATA(lt_item_reported)
    FAILED DATA(lt_item_failed).
    "<<< End: Refresh and populate item entity

    ">>> Start: Refresh and populate impacted goods
    READ ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
    ENTITY Header
    BY \_Items
    ALL FIELDS WITH
    CORRESPONDING #( keys )
    RESULT DATA(lt_items).

    SELECT * FROM zpr_impfg FOR ALL ENTRIES IN @lt_items WHERE material = @lt_items-material INTO TABLE @DATA(lt_config).
    IF sy-subrc EQ 0.
      SORT lt_config BY configmat ASCENDING.
      DELETE ADJACENT DUPLICATES FROM lt_config COMPARING configmat.
      DATA lt_impactedfg_new TYPE TABLE FOR CREATE zr_pr_auth2_head\_ImpactedGoods.
      READ TABLE keys INTO DATA(ls_key1) INDEX 1.
      lt_impactedfg_new = VALUE #( (  %is_draft = ls_key1-%is_draft
                                      PriceAuth = ls_key1-PriceAuth
                                      %target   = VALUE #( FOR config IN lt_config (  %is_draft = ls_key1-%is_draft
                                                                                      PriceAuth = ls_key1-PriceAuth
                                                                                      Material  = config-configmat
                                                                                      ZP1New = 10
                                                                                      ZPXNew = 10
                                                                                      ZGoNew = 10
                                                                                      %control = VALUE #( PriceAuth   = if_abap_behv=>mk-on
                                                                                                          Material    = if_abap_behv=>mk-on
                                                                                                          ZP1New      = if_abap_behv=>mk-on
                                                                                                          ZPXNew      = if_abap_behv=>mk-on
                                                                                                          ZGoNew      = if_abap_behv=>mk-on ) ) ) ) ).
    ENDIF.

    READ ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
    ENTITY Header
    BY \_ImpactedGoods
    ALL FIELDS WITH
    CORRESPONDING #( keys )
    RESULT DATA(lt_impactedfg_current).

    "Delete already existing entries from child entity
    MODIFY ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
    ENTITY ImpactedGoods
    DELETE FROM VALUE #( FOR ls_impactedfg IN lt_impactedfg_current (  %is_draft = ls_impactedfg-%is_draft
                                                                           %key  = ls_impactedfg-%key ) )
    MAPPED DATA(lt_mapped_delete_ig)
    REPORTED DATA(lt_reported_delete_ig)
    FAILED DATA(lt_failed_delete_ig).

    "Create records from newly extract data
    MODIFY ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
    ENTITY Header
    CREATE BY \_ImpactedGoods
    AUTO FILL CID
    WITH lt_impactedfg_new
    MAPPED DATA(lt_item_mapped_ig)
    REPORTED DATA(lt_item_reported_ig)
    FAILED DATA(lt_item_failed_ig).
    "<<< End: Refresh and populate impacted goods

    APPEND VALUE #( %tky = lt_header[ 1 ]-%tky ) TO mapped-header.

    READ ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
        ENTITY Header
        ALL FIELDS WITH
        CORRESPONDING #( keys )
        RESULT lt_header.

    IF failed-header IS INITIAL AND lt_impactedfg_new IS NOT INITIAL.
      "Impacted Finished Goods were added to the list.
      APPEND VALUE #( %msg = new_message( severity = if_abap_behv_message=>severity-success
                                          id = 'ZPRAUTHCSD'
                                          number = '002' )
                    ) TO reported-header.
    ENDIF.

    IF failed-header IS INITIAL.
      "Materials were successfully imported
      APPEND VALUE #( %msg = new_message( severity = if_abap_behv_message=>severity-success
                                          id = 'ZPRAUTHCSD'
                                          number = '003' )
                    ) TO reported-header.
    ENDIF.

    result = VALUE #( FOR header IN lt_header
                          ( %tky   = header-%tky
                            %param = header ) ).

  ENDMETHOD.

  METHOD populate_impactedgoods.
  ENDMETHOD.

  METHOD submit.
  ENDMETHOD.

  METHOD validateEntries.

    READ ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
         ENTITY Header
         ALL FIELDS WITH
         CORRESPONDING #( keys )
         RESULT DATA(lt_header).

*    LOOP AT lt_header INTO DATA(ls_header).
*      APPEND VALUE #(  %tky        = ls_header-%tky
*                       %state_area = 'VALIDATE_ONSAVE'
*                    ) TO reported-header.
*
*      IF ls_header-description IS INITIAL.
*        APPEND VALUE #( %tky = ls_header-%tky ) TO failed-header.
*        APPEND VALUE #( %tky = ls_header-%tky
*                        %state_area         = 'VALIDATE_ONSAVE'
*                        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
*                                                          text = 'Fill up mandatory fields' )
*
*                        %element-Description   = if_abap_behv=>mk-on
*                       ) TO reported-header.
*      ENDIF.
*
*      IF ls_header-validfrom IS INITIAL.
*        APPEND VALUE #( %tky = ls_header-%tky ) TO failed-header.
*        APPEND VALUE #( %tky = ls_header-%tky
*                        %state_area         = 'VALIDATE_ONSAVE'
*                        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
*                                                          text = 'Fill up mandatory fields' )
*
*                        %element-validfrom   = if_abap_behv=>mk-on
*                       ) TO reported-header.
*      ENDIF.
*
*      IF ls_header-validto IS INITIAL.
*        APPEND VALUE #( %tky = ls_header-%tky ) TO failed-header.
*        APPEND VALUE #( %tky = ls_header-%tky
*                        %state_area         = 'VALIDATE_ONSAVE'
*                        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
*                                                          text = 'Fill up mandatory fields' )
*
*                        %element-validto   = if_abap_behv=>mk-on
*                       ) TO reported-header.
*      ENDIF.
*
*      IF ls_header-submittedto IS INITIAL.
*        APPEND VALUE #( %tky = ls_header-%tky ) TO failed-header.
*        APPEND VALUE #( %tky = ls_header-%tky
*                        %state_area         = 'VALIDATE_ONSAVE'
*                        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
*                                                          text = 'Fill up mandatory fields' )
*
*                        %element-submittedto   = if_abap_behv=>mk-on
*                       ) TO reported-header.
*      ENDIF.
*
*      IF ls_header-division IS INITIAL.
*        APPEND VALUE #( %tky = ls_header-%tky ) TO failed-header.
*        APPEND VALUE #( %tky = ls_header-%tky
*                        %state_area         = 'VALIDATE_ONSAVE'
*                        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
*                                                          text = 'Fill up mandatory fields' )
*
*                        %element-division   = if_abap_behv=>mk-on
*                       ) TO reported-header.
*      ENDIF.
*    ENDLOOP.

    READ ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
    ENTITY Header
    BY \_Items
    ALL FIELDS WITH
    CORRESPONDING #( keys )
    RESULT DATA(lt_items).

    SELECT * FROM zpr_impfg FOR ALL ENTRIES IN @lt_items WHERE material = @lt_items-material INTO TABLE @DATA(lt_config).
    IF sy-subrc EQ 0.
      SORT lt_config BY configmat ASCENDING.
      DELETE ADJACENT DUPLICATES FROM lt_config COMPARING configmat.
      DATA lt_impactedfg_new TYPE TABLE FOR CREATE zr_pr_auth2_head\_ImpactedGoods.
      READ TABLE keys INTO DATA(ls_key) INDEX 1.
      lt_impactedfg_new = VALUE #( (  %is_draft = ls_key-%is_draft
                                      PriceAuth = ls_key-PriceAuth
                                      %target   = VALUE #( FOR config IN lt_config (  %is_draft = ls_key-%is_draft
                                                                                      PriceAuth = ls_key-PriceAuth
                                                                                      Material  = config-configmat
                                                                                      ZP1New = 10
                                                                                      ZPXNew = 10
                                                                                      ZGoNew = 10
                                                                                      %control = VALUE #( PriceAuth   = if_abap_behv=>mk-on
                                                                                                          Material    = if_abap_behv=>mk-on
                                                                                                          ZP1New      = if_abap_behv=>mk-on
                                                                                                          ZPXNew      = if_abap_behv=>mk-on
                                                                                                          ZGoNew      = if_abap_behv=>mk-on ) ) ) ) ).
    ENDIF.

    READ ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
    ENTITY Header
    BY \_ImpactedGoods
    ALL FIELDS WITH
    CORRESPONDING #( keys )
    RESULT DATA(lt_impactedfg_current).

    "Delete already existing entries from child entity
    MODIFY ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
    ENTITY ImpactedGoods
    DELETE FROM VALUE #( FOR ls_impactedfg IN lt_impactedfg_current (  %is_draft = ls_impactedfg-%is_draft
                                                                           %key  = ls_impactedfg-%key ) )
    MAPPED DATA(lt_mapped_delete)
    REPORTED DATA(lt_reported_delete)
    FAILED DATA(lt_failed_delete).

    "Create records from newly extract data
    MODIFY ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
    ENTITY Header
    CREATE BY \_ImpactedGoods
    AUTO FILL CID
    WITH lt_impactedfg_new
    MAPPED DATA(lt_item_mapped)
    REPORTED DATA(lt_item_reported)
    FAILED DATA(lt_item_failed).

    IF failed-header IS INITIAL.
*      APPEND VALUE #( %msg = new_message_with_text( severity = if_abap_behv_message=>severity-information
*                                                        text = 'Data has been validated. No errors found.' )
*                    ) TO reported-header.
      APPEND VALUE #( %msg = new_message( severity = if_abap_behv_message=>severity-information
                                          id = 'ZPRAUTHCSD'
                                          number = '001' )
                    ) TO reported-header.

    ENDIF.

  ENDMETHOD.

  METHOD setDefaultValues.
    READ ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
    ENTITY Header
       FIELDS ( SalesOrg DistChannel )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_header).
    MODIFY ENTITIES OF zr_pr_auth2_head IN LOCAL MODE
     ENTITY Header
       UPDATE
         FIELDS ( SalesOrg DistChannel )
        WITH VALUE #( FOR header IN lt_header
                         ( %tky             = header-%tky
                           SalesOrg         = 'PCI'
                           DistChannel      = '04'
                           %control-SalesOrg  = if_abap_behv=>mk-on
                           %control-DistChannel  = if_abap_behv=>mk-on ) )
     FAILED DATA(upd_failed)
     REPORTED DATA(upd_reported).
    reported = CORRESPONDING #( DEEP upd_reported ).
  ENDMETHOD.

ENDCLASS.
