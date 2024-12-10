@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PR Authorization - Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_PR_AUTH_ITEM_V2
  as select from ZI_PR_AUTH2_ITEM
  association to parent ZR_PR_AUTH_HEAD_V2 as _Header on $projection.PriceAuth = _Header.PriceAuth
{
  key PriceAuth,
    @Consumption.valueHelpDefinition: [{ entity: {name: 'ZI_PR_CSD_MAT_STDVH' , element: 'Material' }, useForValidation: true,
                   additionalBinding: [{ localElement: '_Header.Salesorg', element: 'Salesorg', usage: #FILTER },
                                       { localElement: '_Header.Distchannel', element: 'Distchannel', usage: #FILTER },
                                       { localElement: '_Header.Division', element: 'Division', usage: #FILTER }] }]
  key Material,
      Sequence,
      ItemType,
      Status,
      Map,
      Unit,
      Currency,
      GpZpxCurr,
      GpZpxNew,
      GpZprCurr,
      GpZprNew,
      Zp1Curr,
      Zp1New,
      ZgoCurr,
      ZgoNew,
      ZpxCurr,
      ZpxNew,
      Zpr02Curr,
      Zpr02New,
      Zpr03Curr,
      Zpr03New,
      Zpr04Curr,
      Zpr04New,
      Zpr05Curr,
      Zpr05New,
      Zpr06Curr,
      Zpr06New,
      Zpr07Curr,
      Zpr07New,
      Zpr08Curr,
      Zpr08New,
      Zpr09Curr,
      Zpr09New,
      Zpr10Curr,
      Zpr10New,
      Zpr11Curr,
      Zpr11New,
      Zpr12Curr,
      Zpr12New,
      Zpr13Curr,
      Zpr13New,
      Zpr14Curr,
      Zpr14New,
      Zpr15Curr,
      Zpr15New,
      Criticality,
      Localcreatedby,
      Localcreatedat,
      Locallastchangedby,
      Locallastchangedat,
      Lastchangedat,
      _Header
//      _Material
}
