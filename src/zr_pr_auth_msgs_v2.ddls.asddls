@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Price Authorization - Messages'
define view entity ZR_PR_AUTH_MSGS_V2 
as select from ZI_PR_AUTH2_MSGS
association to parent ZR_PR_AUTH_HEAD_V2 as _Header on $projection.PriceAuth = _Header.PriceAuth
{
    key PriceAuth,
    key Sequence,
    Material,
    Messagetype,
    Message,
    Localcreatedby,
    Localcreatedat,
    Locallastchangedby,
    Locallastchangedat,
    Lastchangedat,
    _Header
}
