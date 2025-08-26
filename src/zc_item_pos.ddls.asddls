@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection View of Item POS'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_ITEM_POS
as projection on ZI_ITEM_POS
{

@UI.facet: [{ id: 'facet1',
              purpose: #STANDARD,
              label: 'Item Details',
              type: #IDENTIFICATION_REFERENCE,
              position: 10 },
              {
//              parentId: 'facet1',
              id: 'facet2',
              type: #IDENTIFICATION_REFERENCE,
              label: 'Quantity',
              targetQualifier: 'Quantity',
              position: 20
              }
              ]
    @EndUserText.label: 'Invoice UUID'
    key InvUuid,
    @EndUserText.label: 'Invoice Item UUID'
    key InvItmUuid,
    Invoicenumber,
       @UI: { identification: [{ position:  10 }],
             lineItem:       [{ position: 10 }] }
             @EndUserText.label: 'Item Number'
    Itemnumber,
    @EndUserText.label: 'Quantity'
    @Semantics.quantity.unitOfMeasure: 'Quanunit'
       @UI: { identification: [{ position: 10 , qualifier: 'Quantity' }] ,
//       identification: [{ position:  20 }],
          lineItem:       [{ position: 20 }] }
    Quantity,
    Quanunit,
    @Semantics.amount.currencyCode: 'Currency'
       @UI: { identification:  [{ position: 20 , qualifier: 'Quantity' }] ,
//       identification: [{ position:  30 }],
          lineItem:       [{ position: 30 }] }
          @EndUserText.label: 'Price Each'
    Priceeach,
    @EndUserText.label: 'Total'
    @Semantics.amount.currencyCode: 'Currency'
    Total,
    Currency,
    LocalLastChangeOn,
    LastChangeOn,
    Createdby,
    LocalLastChangeBy,
    LastChangeBy,
    /* Associations */
    _headerPos : redirected to parent ZC_HEADER_POS
}
