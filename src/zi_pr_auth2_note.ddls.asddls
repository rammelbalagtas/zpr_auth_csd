@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PR Authorization - Notes'
define view entity ZI_PR_AUTH2_NOTE as select from zpr_auth2_note
{
      @EndUserText.label : 'PR Auth'
  key price_auth         as PriceAuth,
  key id as Id,
//  sequence as Sequence,
      @EndUserText.label : 'Note'
      note as Note,
      @Semantics.user.createdBy: true
      localcreatedby     as Localcreatedby,
      @Semantics.systemDateTime.createdAt: true
      localcreatedat     as Localcreatedat,
      @Semantics.user.localInstanceLastChangedBy: true
      locallastchangedby as Locallastchangedby,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      locallastchangedat as Locallastchangedat,
      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedat      as Lastchangedat
}
