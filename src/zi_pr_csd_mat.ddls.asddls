@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Materials'
@Search.searchable: true
define view entity zi_pr_csd_mat
  as select from zpr_csd_mat
{
  key salesorg           as Salesorg,
  key distchannel        as Distchannel,
  key division           as Division,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['Description']
  key material           as Material,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @Semantics.text: true
      description        as Description,
      localcreatedby     as Localcreatedby,
      localcreatedat     as Localcreatedat,
      locallastchangedby as Locallastchangedby,
      locallastchangedat as Locallastchangedat,
      lastchangedat      as Lastchangedat
}
