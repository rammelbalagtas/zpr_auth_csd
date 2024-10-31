@EndUserText.label: 'PR Authorization - Header'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_PR_AUTH2_HEAD
  as select from zpr_auth2_head
{
      @EndUserText.label : 'PR Auth'
  key price_auth         as PriceAuth,
      @EndUserText.label : 'High Priority'
      high_priority      as HighPriority,
      @EndUserText.label : 'Description'
      description        as Description,
      @EndUserText.label : 'Valid From'
      valid_from         as ValidFrom,
      @EndUserText.label : 'Valid To'
      valid_to           as ValidTo,
      @EndUserText.label : 'Status'
      status             as Status,
      @EndUserText.label : 'Action'
      action             as Action,
      @EndUserText.label : 'Sales Organization'
      salesorg           as Salesorg,
      @EndUserText.label : 'Distribution Channel'
      distchannel        as Distchannel,
      @EndUserText.label : 'Division'
      division           as Division,
      @EndUserText.label : 'Submit To'
      submit_to       as SubmitTo,
      @EndUserText.label : 'Submitted To'
      submitted_to       as SubmittedTo,
      @EndUserText.label : 'Submitted By'
      submitted_by       as SubmittedBy,
      @EndUserText.label : 'Notify'
      notify             as Notify,
      @EndUserText.label : 'File to import'
      attachment_u       as AttachmentUpload,
      mimetype_u         as MimeTypeUpload,
      filename_u         as FilenameUpload,
      @EndUserText.label : 'File to export'
      attachment_d       as AttachmentDownload,
      mimetype_d         as MimeTypeDownload,
      filename_d         as FilenameDownload,
      @EndUserText.label : 'Materials'
      materialcount      as Materialcount,
      @EndUserText.label : 'Impacted Finished Goods'
      impactedfgcount    as Impactedfgcount,
      @EndUserText.label : 'Notes'
      notescount         as Notescount,
      @EndUserText.label : 'Messages'
      messagescount      as Messagescount,
      @Semantics.user.createdBy: true
      localcreatedby     as Localcreatedby,
      @Semantics.systemDateTime.createdAt: true
      localcreatedat     as Localcreatedat,
      @Semantics.user.localInstanceLastChangedBy: true
      locallastchangedby as Locallastchangedby,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      locallastchangedat as Locallastchangedat,
      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedat      as Lastchangedat
}
