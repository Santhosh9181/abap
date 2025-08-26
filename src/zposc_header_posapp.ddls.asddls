@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.sapObjectNodeType.name: 'ZPOSHEADER_POSAPP'
define root view entity ZPOSC_HEADER_POSAPP
  provider contract TRANSACTIONAL_QUERY
  as projection on ZPOSR_HEADER_POSAPP
{
  key InvUuid,
  Invoicenumber,
  Customername,
  Phonenumber,
  Total,
  @Semantics.currencyCode: true
  Currency,
  LocalLastChangeOn,
  LastChangeOn,
  Createdby,
  LocalLastChangeBy,
  LastChangeBy
  
}
