@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_PR_CSD_MAT
  as select from zpr_csd_mat as Materials
{
  key salesorg as Salesorg,
  key distchannel as Distchannel,
  key division as Division,
  key material as Material,
  description as Description,
  config as Config,
  gpzpxcurr as GpZpxCurr,
  gpzprcurr as GpZprCurr,
  zp1curr as Zp1Curr,
  zgocurr as ZgoCurr,
  zpxcurr as ZpxCurr,
  zpr02curr as Zpr02Curr,
  zpr03curr as Zpr03Curr,
  zpr04curr as Zpr04Curr,
  zpr05curr as Zpr05Curr,
  zpr06curr as Zpr06Curr,
  zpr07curr as Zpr07Curr,
  zpr08curr as Zpr08Curr,
  zpr09curr as Zpr09Curr,
  zpr10curr as Zpr10Curr,
  zpr11curr as Zpr11Curr,
  zpr12curr as Zpr12Curr,
  zpr13curr as Zpr13Curr,
  zpr14curr as Zpr14Curr,
  zpr15curr as Zpr15Curr,
  @Semantics.user.createdBy: true
  localcreatedby as Localcreatedby,
  @Semantics.systemDateTime.createdAt: true
  localcreatedat as Localcreatedat,
  @Semantics.user.localInstanceLastChangedBy: true
  locallastchangedby as Locallastchangedby,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  locallastchangedat as Locallastchangedat,
  @Semantics.systemDateTime.lastChangedAt: true
  lastchangedat as Lastchangedat
  
}
