@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Header POS Interface view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_HEADER_POS as select from zheader_pos
composition [0..*] of ZI_ITEM_POS as _ItemPos

{
    key inv_uuid as InvUuid,
    invoicenumber as Invoicenumber,
    customername as Customername,
    phonenumber as Phonenumber,
    @Semantics.amount.currencyCode: 'Currency'
    total as Total,
    currency as Currency,
    local_last_change_on as LocalLastChangeOn,
    last_change_on as LastChangeOn,
    createdby as Createdby,
    local_last_change_by as LocalLastChangeBy,
    last_change_by as LastChangeBy,
    _ItemPos
}
