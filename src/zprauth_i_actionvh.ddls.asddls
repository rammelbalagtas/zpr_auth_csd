@EndUserText.label: 'Action Value help'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_PRAUTH_ACTION_VH'
@ObjectModel : { resultSet.sizeCategory: #XS }
@Search.searchable: true
define custom entity ZPRAUTH_I_ACTIONVH
{
      @EndUserText.label: 'Action'
      @EndUserText.quickInfo: 'Action'
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
  key Action   : abap.char(50);
      @UI.lineItem : [{ exclude: true} ]
      SubmittedBy : abap.char(50);
      @UI.lineItem : [{ exclude: true} ]
      Status   : abap.char(50);
}
