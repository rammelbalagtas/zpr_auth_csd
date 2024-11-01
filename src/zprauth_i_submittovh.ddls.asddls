@EndUserText.label: 'Submit to Value help'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_PRAUTH_SUBMITTO_VH'
@ObjectModel : { resultSet.sizeCategory: #XS }
@Search.searchable: true
define custom entity ZPRAUTH_I_SUBMITTOVH
{
      @EndUserText.label: 'User ID'
      @EndUserText.quickInfo: 'User ID'
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
  key UserId   : abap.char(10);
      @UI.lineItem : [{ exclude: true} ]
      Role     : abap.char(30);
      @UI.lineItem : [{ exclude: true} ]
      Division : abap.char(2);
      @UI.lineItem : [{ exclude: true} ]
      SubmittedBy : abap.char(50);
      @UI.lineItem : [{ exclude: true} ]
      SubmittedTo : abap.char(50);
      @UI.lineItem : [{ exclude: true} ]
      Status   : abap.char(50);
}
