@EndUserText.label: 'Price Authorization - Messages'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_PR_AUTH2_MSGS as projection on ZR_PR_AUTH2_MSGS
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
    /* Associations */
     _Header   : redirected to parent ZC_PR_AUTH2_HEAD
}
