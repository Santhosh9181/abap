@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@ObjectModel.sapObjectNodeType.name: 'ZPOSHEADER_POSAPP'
define root view entity ZPOSR_HEADER_POSAPP
  as select from ZHEADER_POS as HeaderApp
{
  key inv_uuid as InvUuid,
  invoicenumber as Invoicenumber,
  customername as Customername,
  phonenumber as Phonenumber,
  @Semantics.amount.currencyCode: 'Currency'
  total as Total,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
  currency as Currency,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_change_on as LocalLastChangeOn,
  @Semantics.systemDateTime.lastChangedAt: true
  last_change_on as LastChangeOn,
  @Semantics.user.createdBy: true
  createdby as Createdby,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_change_by as LocalLastChangeBy,
  @Semantics.user.lastChangedBy: true
  last_change_by as LastChangeBy
  
}
