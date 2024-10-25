@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_CSDDIVISION
  as select from ZCSDDIVISION
{
  key division as Division,
  description as Description,
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
