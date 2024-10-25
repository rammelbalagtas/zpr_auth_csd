@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_PR_IMPFG
  as select from ZPR_IMPFG
{
  key configmat as Configmat,
  key material as Material,
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
