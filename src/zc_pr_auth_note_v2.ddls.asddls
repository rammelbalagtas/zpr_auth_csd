@EndUserText.label: 'Price Authorization - Notes'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_PR_AUTH_NOTE_V2
  as projection on ZR_PR_AUTH_NOTE_V2
{
  key PriceAuth,
  key Id,
//      Sequence,
      Note,
      Localcreatedby,
      Localcreatedat,
      Locallastchangedby,
      Locallastchangedat,
      Lastchangedat,
      /* Associations */
      _Header : redirected to parent ZC_PR_AUTH_HEAD_V2
}
