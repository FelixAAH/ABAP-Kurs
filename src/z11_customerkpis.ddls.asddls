@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'CDS 05 Aufgabe'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z11_CustomerKPIs
  with parameters
    P_City : /dmo/city
  as select from Z11_TravelWithCustomer

{
  key CustomerID                      as CustomerId,

      CustomerName                    as CustomerName,
      Street                          as Street,
      PostalCode                      as PostalCode,
      City                            as City,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(BookingFee + TotalPrice)    as TotalRevenue,

      CurrencyCode                    as CurrencyCode,
      avg(Duration as abap.dec(16,2)) as AverageDuration,
      count(distinct AgencyId)        as NumberOfDifferentAgencies
}
group by CustomerID,
         CustomerName,
         Street,
         PostalCode,
         City,
         CurrencyCode
having sum(BookingFee + TotalPrice ) >= 5000
and City  = $parameters.P_City
