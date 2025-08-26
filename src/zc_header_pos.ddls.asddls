@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection View of Header POS'
@Metadata.ignorePropagatedAnnotations: true


@UI.headerInfo: { description: { label: 'S' },
                  title : { label: 'Santhosh Super Market' , value: 'Invoicenumber'}
                   }
@UI.headerInfo.typeName: 'Sales Lists'
@UI.headerInfo.typeNamePlural: 'Sales Lists'
define root view entity  ZC_HEADER_POS
  provider contract transactional_query as projection on ZI_HEADER_POS
{


@UI.facet: [
{
id : 'Header',
type: #DATAPOINT_REFERENCE,
targetQualifier: 'header',
purpose: #HEADER
},
  { 
    id: 'Facet1',
    position: 10,
    type: #COLLECTION,
    label: 'Invoice Header Info'
    }

  ,{
   id: 'Facet2',
   parentId: 'Facet1',
    position: 10,
    type: #FIELDGROUP_REFERENCE,
    targetQualifier: 'FieldGroup1',
    label: 'General Information',
    purpose: #STANDARD
    
  },
  {
   id: 'Facet3',
   parentId: 'Facet1',
    position: 20,
    type: #FIELDGROUP_REFERENCE,
    targetQualifier: 'FieldGroup2',
    label: 'Change Details',
    purpose: #STANDARD
    
  },
  {
  id: 'Items',
  type: #LINEITEM_REFERENCE,
  targetElement: '_ItemPos',
  label: 'Items',
  position: 20
  }
]   @EndUserText.label: 'Invoice UUID'
    key InvUuid,
   @UI: { fieldGroup: [{ position:  10, qualifier: 'FieldGroup1'}],
          lineItem:       [{ position: 10 }],
          selectionField: [{ position: 10 }] }   
    @EndUserText.label: 'Invoice Number' 
    Invoicenumber,
   @UI: {fieldGroup: [{ position:  20,  qualifier: 'FieldGroup1'}],
          lineItem:       [{ position: 20 }],
          selectionField: [{ position: 20 }] }
          @EndUserText.label: 'Customer Name'
    Customername,
   @UI: {fieldGroup: [{ position:  30,  qualifier: 'FieldGroup1'}],
          lineItem:       [{ position: 30 }] }
          @EndUserText.label: 'Phone Number'    
    Phonenumber,
    @Semantics.amount.currencyCode: 'Currency'
    //@UI: {fieldGroup: [{ position:  40, qualifier: 'FieldGroup1'}] }
    @UI.dataPoint: { qualifier: 'header' }
    @EndUserText.label: 'Total'
    Total,
    Currency,
    @UI: {fieldGroup: [{ position:  10, qualifier: 'FieldGroup2'}] }
    LocalLastChangeOn,
    @UI: {fieldGroup: [{ position:  20, qualifier: 'FieldGroup2'}] }
    LastChangeOn,
    @UI: {fieldGroup: [{ position:  30, qualifier: 'FieldGroup2'}] }
    Createdby,
    @UI: {fieldGroup: [{ position:  40, qualifier: 'FieldGroup2'}] }
    LocalLastChangeBy,
    @UI: {fieldGroup: [{ position:  50, qualifier: 'FieldGroup2'}] }
    LastChangeBy,
    /* Associations */
    _ItemPos : redirected to composition child ZC_ITEM_POS
}
