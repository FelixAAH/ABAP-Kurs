@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS 07 Aufgabe'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z11_CustomerWithTravels as 
  select from Z11_Customer
  
    association [0..*] to Z11_Travel as _Travels on $projection.CustomerId = _Travels.CustomerId
{
  key CustomerId,
  FirstName,
  LastName,
  Title,
  Street,
  PostalCode,
  City,
  CountryCode,
  
  /* Associations */
  
  _Travels
}
