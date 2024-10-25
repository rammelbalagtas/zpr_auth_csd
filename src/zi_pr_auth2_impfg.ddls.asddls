@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PR Authorization - Impacted FG'
define view entity ZI_PR_AUTH2_IMPFG
  as select from zpr_auth2_impfg
{
      @EndUserText.label : 'PR Auth'
  key price_auth         as PriceAuth,
      @EndUserText.label : 'Material'
  key material           as Material,
      sequence           as Sequence,
      item_type          as ItemType,
      status             as Status,
      @EndUserText.label : 'Map'
      map                as Map,
      unit               as Unit,
      currency           as Currency,
      @EndUserText.label : 'ZPX GP% (Current)'
      gp_zpx_curr        as GpZpxCurr,
      @EndUserText.label : 'ZPX GP% (New)'
      gp_zpx_new         as GpZpxNew,
      @EndUserText.label : 'ZPR GP% (Current)'
      gp_zpr_curr        as GpZprCurr,
      @EndUserText.label : 'ZPX GP% (New)'
      gp_zpr_new         as GpZprNew,
      @EndUserText.label : 'ZP1 (Current)'
      zp1_curr           as Zp1Curr,
      @EndUserText.label : 'ZP1 (New)'
      zp1_new            as Zp1New,
      @EndUserText.label : 'ZGO (Current)'
      zgo_curr           as ZgoCurr,
      @EndUserText.label : 'ZGO (New)'
      zgo_new            as ZgoNew,
      @EndUserText.label : 'ZPX (Current)'
      zpx_curr           as ZpxCurr,
      @EndUserText.label : 'ZPX (New)'
      zpx_new            as ZpxNew,
      @EndUserText.label : 'ZPR02 (Current)'
      zpr02_curr         as Zpr02Curr,
      @EndUserText.label : 'ZPR02 (New)'
      zpr02_new          as Zpr02New,
      @EndUserText.label : 'ZPR03 (Current)'
      zpr03_curr         as Zpr03Curr,
      @EndUserText.label : 'ZPR03 (New)'
      zpr03_new          as Zpr03New,
      @EndUserText.label : 'ZPR04 (Current)'
      zpr04_curr         as Zpr04Curr,
      @EndUserText.label : 'ZPR04 (New)'
      zpr04_new          as Zpr04New,
      @EndUserText.label : 'ZPR05 (Current)'
      zpr05_curr         as Zpr05Curr,
      @EndUserText.label : 'ZPR05 (New)'
      zpr05_new          as Zpr05New,
      @EndUserText.label : 'ZPR06 (Current)'
      zpr06_curr         as Zpr06Curr,
      @EndUserText.label : 'ZPR06 (New)'
      zpr06_new          as Zpr06New,
      @EndUserText.label : 'ZPR07 (Current)'
      zpr07_curr         as Zpr07Curr,
      @EndUserText.label : 'ZPR07 (New)'
      zpr07_new          as Zpr07New,
      @EndUserText.label : 'ZPR08 (Current)'
      zpr08_curr         as Zpr08Curr,
      @EndUserText.label : 'ZPR08 (New)'
      zpr08_new          as Zpr08New,
      @EndUserText.label : 'ZPR09 (Current)'
      zpr09_curr         as Zpr09Curr,
      @EndUserText.label : 'ZPR09 (New)'
      zpr09_new          as Zpr09New,
      @EndUserText.label : 'ZPR10 (Current)'
      zpr10_curr         as Zpr10Curr,
      @EndUserText.label : 'ZPR10 (New)'
      zpr10_new          as Zpr10New,
      @EndUserText.label : 'ZPR11 (Current)'
      zpr11_curr         as Zpr11Curr,
      @EndUserText.label : 'ZP11 (New)'
      zpr11_new          as Zpr11New,
      @EndUserText.label : 'ZPR12 (Current)'
      zpr12_curr         as Zpr12Curr,
      @EndUserText.label : 'ZPR12 (New)'
      zpr12_new          as Zpr12New,
      @EndUserText.label : 'ZPR13 (Current)'
      zpr13_curr         as Zpr13Curr,
      @EndUserText.label : 'ZPR13 (New)'
      zpr13_new          as Zpr13New,
      @EndUserText.label : 'ZPR14 (Current)'
      zpr14_curr         as Zpr14Curr,
      @EndUserText.label : 'ZPR14 (New)'
      zpr14_new          as Zpr14New,
      @EndUserText.label : 'ZPR15 (Current)'
      zpr15_curr         as Zpr15Curr,
      @EndUserText.label : 'ZPR15 (New)'
      zpr15_new          as Zpr15New,
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
