@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PR Authorization - Messages'
define view entity ZI_PR_AUTH2_MSGS as select from zpr_auth2_msgs
{
      @EndUserText.label : 'PR Auth'
  key price_auth         as PriceAuth,
  key sequence as Sequence,
      @EndUserText.label : 'Material'
      material as Material,
      @EndUserText.label : 'Message Type'
      messagetype as Messagetype,
      @EndUserText.label : 'Message'
      message as Message,
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
