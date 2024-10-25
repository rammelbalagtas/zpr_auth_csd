@EndUserText.label: 'Price Authorization - Header'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_PR_AUTH2_HEAD
  provider contract transactional_query
  as projection on ZR_PR_AUTH2_HEAD
{
  key PriceAuth,
      HighPriority,
      Description,
      ValidFrom,
      ValidTo,
      Status,
      Salesorg,
      Distchannel,
      Division,
      SubmittedTo,
      @Semantics.largeObject: {
        acceptableMimeTypes: [ 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' ],
        cacheControl.maxAge: #MEDIUM,
        contentDispositionPreference: #ATTACHMENT , // #ATTACHMENT - download as file
                                                    // #INLINE - open in new window
        fileName: 'FilenameUpload',
        mimeType: 'MimeTypeUpload'
      }
      AttachmentUpload,
      @Semantics.mimeType: true
      MimeTypeUpload,
      FilenameUpload,

      @Semantics.largeObject: {
        acceptableMimeTypes: [ 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' ],
        cacheControl.maxAge: #MEDIUM,
        contentDispositionPreference: #INLINE , // #ATTACHMENT - download as file
                                                    // #INLINE - open in new window
        fileName: 'FilenameDownload',
        mimeType: 'MimeTypeDownload'
      }
      AttachmentDownload,
      @Semantics.mimeType: true
      MimeTypeDownload,
      FilenameDownload,
      Localcreatedby,
      Localcreatedat,
      Locallastchangedby,
      Locallastchangedat,
      Lastchangedat,
      /* Associations */
      _Items         : redirected to composition child ZC_PR_AUTH2_ITEM,
      _ImpactedGoods : redirected to composition child ZC_PR_AUTH2_IMPFG,
      _Messages      : redirected to composition child ZC_PR_AUTH2_MSGS,
      _Notes         : redirected to composition child ZC_PR_AUTH2_NOTE
}
