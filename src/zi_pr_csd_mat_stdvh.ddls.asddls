@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material'
@Search.searchable: true
define view entity zi_pr_csd_mat_stdvh
  as select from zi_pr_csd_mat
{
      @UI.lineItem : [{ exclude: true} ]
//      @UI.selectionField: [{exclude: true}]
  key Salesorg,
      @UI.lineItem : [{ exclude: true} ]
//      @UI.selectionField: [{exclude: true}]
  key Distchannel,
      @UI.lineItem : [{ exclude: true} ]
//      @UI.selectionField: [{exclude: true}]
  key Division,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['Description']
      @UI.textArrangement: #TEXT_SEPARATE
      @UI.lineItem: [{ position: 10, importance: #HIGH }]
      @UI.selectionField : [ { position: 10 } ]
  key Material,
      @Search.defaultSearchElement: true
      @UI.textArrangement: #TEXT_SEPARATE
      @UI.lineItem: [{ position: 20, importance: #HIGH }]
      @UI.selectionField : [ { position: 20 } ]
      Description

}
