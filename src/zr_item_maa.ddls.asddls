@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Item Transactional View'

@ObjectModel.usageType: {
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}

define view entity ZR_ITEM_MAA 
    as select from ZI_ITEM_MAA
    association to parent ZR_ORDER_MAA as _Order on $projection.OrderUUID = _Order.OrderUUID
{
    key ItemUUID,
        OrderUUID,
        Name,
        Price,
        Currency,
        Quantity,
        _Order
}
