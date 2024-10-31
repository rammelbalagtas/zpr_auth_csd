@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'message type value help'
@ObjectModel : { resultSet.sizeCategory: #XS }
@Search.searchable: true
/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define view entity ZI_SUBMITTEDBY_VH
as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZSUBMITTEDBY')
{
    @ObjectModel.text.element: ['Description']
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    @UI.textArrangement: #TEXT_ONLY
    key value_low as Code,
    @Semantics.text: true
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    text as Description
} where language = 'E'
