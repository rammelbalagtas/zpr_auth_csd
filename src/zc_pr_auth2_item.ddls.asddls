@EndUserText.label: 'Item'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
//@ObjectModel.query.implementedBy:'ABAP:ZCL_CE_MRPA_OUTPUT'
define view entity ZC_PR_AUTH2_ITEM
  as projection on ZR_PR_AUTH2_ITEM
{
  key PriceAuth,
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
      /* Associations */
      _Header : redirected to parent ZC_PR_AUTH2_HEAD
}
