@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PR Authorization - Header'
define root view entity ZR_PR_AUTH_HEAD_V2
    as select from ZI_PR_AUTH2_HEAD
    composition [0..*] of ZR_PR_AUTH_ITEM_V2 as _Items
    composition [0..*] of ZR_PR_AUTH_IMPFG_V2  as _ImpactedGoods
    composition [0..*] of ZR_PR_AUTH_MSGS_V2 as _Messages
    composition [0..*] of ZR_PR_AUTH_NOTE_V2 as _Notes
{
    key PriceAuth,
    HighPriority,
    Description,
    ValidFrom,
    ValidTo,
    Status,
    @Consumption.valueHelpDefinition: [{ entity: {name: 'ZPRAUTH_I_ACTIONVH' , element: 'Action' }, useForValidation: true,
                   additionalBinding: [{ localElement: 'SubmittedBy', element: 'SubmittedBy', usage: #FILTER },
                                       { localElement: 'Status', element: 'Status', usage: #FILTER }] }]
    Action,
    Salesorg,
    Distchannel,
    @Consumption.valueHelpDefinition: [{ entity: {name: 'zcsd_division_stdvh' , element: 'Division' }, useForValidation: true }]
    Division,
    @Consumption.valueHelpDefinition: [{ entity: {name: 'ZPRAUTH_I_SUBMITTOVH' , element: 'UserId' }, useForValidation: true,
                   additionalBinding: [{ localElement: 'Division', element: 'Division', usage: #FILTER },
                                       { localElement: 'SubmittedBy', element: 'SubmittedBy', usage: #FILTER },
                                       { localElement: 'SubmittedTo', element: 'SubmittedTo', usage: #FILTER },
                                       { localElement: 'Status', element: 'Status', usage: #FILTER }] }]
    SubmitTo,
    SubmittedTo,
    @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_SUBMITTEDBY_VH', element: 'Description' }, useForValidation: true }]
    SubmittedBy,
    Notify,
    AttachmentUpload,
    MimeTypeUpload,
    FilenameUpload,
    AttachmentDownload,
    MimeTypeDownload,
    FilenameDownload,
    Materialcount,
    Impactedfgcount,
    Notescount,
    Messagescount,
    Localcreatedby,
    Localcreatedat,
    Locallastchangedby,
    Locallastchangedat,
    Lastchangedat,
     _Items,
     _ImpactedGoods,
     _Messages,
     _Notes
}
