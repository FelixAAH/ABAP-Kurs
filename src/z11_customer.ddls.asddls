@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 4 Ex CDS 02'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z11_Customer as select from /dmo/customer
{
  key customer_id as CustomerId,
  first_name as FirstName,
  last_name as LastName,
  title as Title,
  street as Street,
  postal_code as PostalCode,
  city as City,
  country_code as CountryCode
}
