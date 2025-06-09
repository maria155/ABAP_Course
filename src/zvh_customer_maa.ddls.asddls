@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Customer'

define view entity ZVH_CUSTOMER_MAA
  as select from /dmo/customer
{
  key customer_id as CustomerID,
  concat_with_space( first_name, last_name, 1 ) as FullName,
  first_name,
  last_name
}
