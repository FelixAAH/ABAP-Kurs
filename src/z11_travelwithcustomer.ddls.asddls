@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 5 Ex CDS 03'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z11_TravelWithCustomer
  as select from Z11_Travel   as t

    inner join   Z11_Customer as c on t.CustomerId = c.CustomerId
                                   and c.CountryCode = 'DE'
{
  key t.TravelId,
      t.AgencyId,
      t.BeginDate,
      t.EndDate,

      @EndUserText.label: 'Anzahl Tage'
      dats_days_between(t.BeginDate, t.EndDate)                            as Duration,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(
      amount => t.TotalPrice,
      source_currency => t.CurrencyCode,
      target_currency => cast('EUR' as abap.cuky),
      exchange_rate_date => $session.system_date, error_handling => 'SET_TO_NULL' ) as TotalPrice,
      cast('EUR' as abap.cuky)                                            as CurrencyCode,


      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(
      amount => t.BookingFee,
      source_currency => t.CurrencyCode,
      target_currency => cast('EUR' as abap.cuky),
      exchange_rate_date => $session.system_date, error_handling => 'SET_TO_NULL' ) as BookingFee,
      cast('EUR' as abap.cuky)                                             as CurrencyCode2,

      t.Description                                                        as Description,
      t.Status                                                             as Status,
      //t.Status as Status,
      //status_text.ddtext as StatusText,
      c.CustomerId                                                         as CustomerID,

      case
         when c.Title is not null and c.Title <> ''
         then concat_with_space(concat_with_space(c.Title, c.FirstName, 1), c.LastName, 1)
         else concat_with_space(c.FirstName, c.LastName, 1)
       end                                                                 as CustomerName,

      c.Street,
      c.PostalCode,
      c.City
}
