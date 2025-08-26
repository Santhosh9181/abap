@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ITEM POS Interface view'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_ITEM_POS
  as select from zitem_pos
  association to parent ZI_HEADER_POS as _headerPos on $projection.InvUuid = _headerPos.InvUuid
{
  key inv_uuid as InvUuid,
  key inv_itm_uuid         as InvItmUuid,
  
      invoicenumber        as Invoicenumber,
      itemnumber           as Itemnumber,
      @Semantics.quantity.unitOfMeasure: 'Quanunit'
      quantity             as Quantity,
      quanunit             as Quanunit,
      @Semantics.amount.currencyCode: 'Currency'
      priceeach            as Priceeach,
      @Semantics.amount.currencyCode: 'Currency'
      total                as Total,
      currency             as Currency,
      local_last_change_on as LocalLastChangeOn,
      last_change_on       as LastChangeOn,
      createdby            as Createdby,
      local_last_change_by as LocalLastChangeBy,
      last_change_by       as LastChangeBy,
      _headerPos // Make association public
}
