@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'RestrictedTraveltransactionalProcession'

define root view entity ZR_11_TravelTP
  as select from ZI_11_Travel
  
  association [1..1] to ZI_11_CustomerText as _CustomerText on $projection.CustomerId = _CustomerText.CustomerId
  
  composition [0..*] of ZR_11_BOOKINGTP as _Bookings

{
  key TravelId,

      AgencyId,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      Status,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      
      /* Transient Data */
      case Status when 'x' then 1
                  when 'P' then 2
                  when 'B' then 3
                  else 0 end          as StatusCriticality,
                  
      _CustomerText.CustomerName as CustomerName,
      
      /* Associations */
      _Bookings
}
