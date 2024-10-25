@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Division'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel : { resultSet.sizeCategory: #XS }
@Search.searchable: true
define view entity zcsd_division_stdvh
  as select from zi_pr_csd_division
{
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['Description']
      @UI.textArrangement: #TEXT_LAST
      @UI.lineItem: [{ position: 10, importance: #HIGH }]
      @UI.selectionField : [ { position: 10 } ]
  key Division,
      @Search.defaultSearchElement: true
      @UI.lineItem: [{ position: 20, importance: #HIGH }]
      @UI.selectionField : [ { position: 20 } ]
      Description
}
