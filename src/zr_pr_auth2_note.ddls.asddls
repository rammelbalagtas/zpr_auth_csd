@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Price Authorization - Notes'
define view entity ZR_PR_AUTH2_NOTE 
as select from ZI_PR_AUTH2_NOTE
association to parent ZR_PR_AUTH2_HEAD as _Header on $projection.PriceAuth = _Header.PriceAuth
{
    key PriceAuth,
    key Id,
//    Sequence,
    Note,
    Localcreatedby,
    Localcreatedat,
    Locallastchangedby,
    Locallastchangedat,
    Lastchangedat,
    _Header
}
