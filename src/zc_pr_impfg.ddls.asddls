@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_PR_IMPFG
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_PR_IMPFG
{
  key Configmat,
  key Material,
  Localcreatedby,
  Localcreatedat,
  Locallastchangedby,
  Locallastchangedat,
  Lastchangedat
  
}
