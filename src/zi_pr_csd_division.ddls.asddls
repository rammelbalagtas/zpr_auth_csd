@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Division'
@Search.searchable: true
define view entity zi_pr_csd_division
  as select from zcsddivision
{
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['Description']
  key division           as Division,
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
