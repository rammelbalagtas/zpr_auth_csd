@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_PR_CSD_MAT
  provider contract transactional_query
  as projection on ZR_PR_CSD_MAT
{
  key Salesorg,
  key Distchannel,
  key Division,
  key Material,
  Description,
  Config,
  GpZpxCurr,
  GpZprCurr,
  Zp1Curr,
  ZgoCurr,
  ZpxCurr,
  Zpr02Curr,
  Zpr03Curr,
  Zpr04Curr,
  Zpr05Curr,
  Zpr06Curr,
  Zpr07Curr,
  Zpr08Curr,
  Zpr09Curr,
  Zpr10Curr,
  Zpr11Curr,
  Zpr12Curr,
  Zpr13Curr,
  Zpr14Curr,
  Zpr15Curr,
  Localcreatedby,
  Localcreatedat,
  Locallastchangedby,
  Locallastchangedat,
  Lastchangedat
  
}
