@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Price Authorization - Notes'
define view entity ZR_PR_AUTH_NOTE_V2
  as select from ZI_PR_AUTH2_NOTE
  association to parent ZR_PR_AUTH_HEAD_V2 as _Header on $projection.PriceAuth = _Header.PriceAuth
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
