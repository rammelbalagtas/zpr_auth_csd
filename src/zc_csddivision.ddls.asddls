@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_CSDDIVISION
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_CSDDIVISION
{
  key Division,
  Description,
  Localcreatedby,
  Localcreatedat,
  Locallastchangedby,
  Locallastchangedat,
  Lastchangedat
  
}
