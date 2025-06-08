@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Interface View'

@ObjectModel.usageType: {
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}

define view entity ZI_ORDER_MAA 
    as select from zorder_maa as _Order
{
    key orderuuid as OrderUUID,
        orderid as OrderID,
        name as Name,
        status as Status,
        customer as Customer,
        creation_date as CreationDate,
        cancellation_date as CancellationDate,
        completion_date as CompletionDate,
        delivery_country as DeliveryCountry,
        total_price as TotalPrice,
        currency as Currency
}
