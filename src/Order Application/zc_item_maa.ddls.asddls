@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Item Consumption View'

define view entity ZC_ITEM_MAA 
    as projection on ZR_ITEM_MAA
{
    key ItemUUID,
        OrderUUID,
        Name,
        Price,
        Currency,
        Quantity,
        _Order : redirected to parent ZC_ORDER_MAA
}
