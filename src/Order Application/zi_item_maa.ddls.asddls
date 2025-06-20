@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Item Interface View'

define view entity ZI_ITEM_MAA 
    as select from zitem_maa 
{
    key itemuuid as ItemUUID,
        orderuuid as OrderUUID,
        name as Name,
        price as Price,
        currency as Currency,
        quantity as Quantity
}
