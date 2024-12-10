@EndUserText.label: 'Price Authorization - Header'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_PR_AUTH_HEAD_V2
  provider contract transactional_query
  as projection on ZR_PR_AUTH_HEAD_V2
{
  key PriceAuth,
      HighPriority,
      Description,
      ValidFrom,
      ValidTo,
      Status,
      Action,
      Salesorg,
      Distchannel,
      Division,
      SubmitTo,
      SubmittedTo,
      SubmittedBy,
//      @Semantics.largeObject: {
//        acceptableMimeTypes: [ 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' ],
//        cacheControl.maxAge: #MEDIUM,
//        contentDispositionPreference: #ATTACHMENT , // #ATTACHMENT - download as file
//                                                    // #INLINE - open in new window
//        fileName: 'FilenameUpload',
//        mimeType: 'MimeTypeUpload'
//      }
//      AttachmentUpload,
//      @Semantics.mimeType: true
//      MimeTypeUpload,
//      FilenameUpload,

//      @Semantics.largeObject: {
//        acceptableMimeTypes: [ 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' ],
//        cacheControl.maxAge: #MEDIUM,
//        contentDispositionPreference: #INLINE , // #ATTACHMENT - download as file
//                                                    // #INLINE - open in new window
//        fileName: 'FilenameDownload',
//        mimeType: 'MimeTypeDownload'
//      }
//      AttachmentDownload,
//      @Semantics.mimeType: true
//      MimeTypeDownload,
//      FilenameDownload,
      Materialcount,
      Impactedfgcount,
      Notescount,
      Messagescount,
      Localcreatedby,
      Localcreatedat,
      Locallastchangedby,
      Locallastchangedat,
      Lastchangedat,
      /* Associations */
      _Items         : redirected to composition child ZC_PR_AUTH_ITEM_V2,
      _ImpactedGoods : redirected to composition child ZC_PR_AUTH_IMPFG_V2,
      _Messages      : redirected to composition child ZC_PR_AUTH_MSGS_V2,
      _Notes         : redirected to composition child ZC_PR_AUTH_NOTE_V2
}
