@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 5 Ex CDS 03'
@Metadata.ignorePropagatedAnnotations: false
define view entity Z11_TravelWithCustomer
  as select from Z11_Travel as t

    inner join   Z11_Customer   as c on t.CustomerId = c.CustomerId
{
 key c.CustomerId,
 key t.TravelId,
 c.FirstName,
 c.LastName,
 c.Title,
 c.Street,
 c.PostalCode,
 c.City,
 c.CountryCode,
 t.AgencyId,
 t.BeginDate,
 t.EndDate,
 t.BookingFee,
 t.TotalPrice,
 t.CurrencyCode

}
