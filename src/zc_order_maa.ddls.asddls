@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Consumption View'
@Metadata.allowExtensions: true

define root view entity ZC_ORDER_MAA 
    provider contract transactional_query
    as projection on ZR_ORDER_MAA
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
        _Item : redirected to composition child ZC_ITEM_MAA
}
