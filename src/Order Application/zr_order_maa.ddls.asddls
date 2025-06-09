@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Transactional View'

define root view entity ZR_ORDER_MAA 
    as select from ZI_ORDER_MAA
    composition [0..*] of ZR_ITEM_MAA as _Item

{
    key OrderUUID,
        OrderID,
        Name,
        Status,
        Customer,
        CreationDate,
        CancellationDate,
        CompletionDate,
        DeliveryCountry,
        TotalPrice,
        Currency,
        _Item
}
