@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel'

@Search.searchable: true

@Metadata.allowExtensions: true
define root view entity ZC_11_TravelTP
  provider contract transactional_query
  as projection on ZR_11_TravelTP

{
  key TravelId,

      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_AGENCY_STDVH', element: 'AgencyId' } } ]
      AgencyId,
      
      @Consumption.valueHelpDefinition: [{ entity: {name: 'ZI_11_CustomerVH', element: 'CustomerId' } } ]
      CustomerId,
      BeginDate,
      EndDate,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      @Consumption.valueHelpDefinition: [{ entity: {name: 'I_CURRENCYSTDVH', element: 'Currency' } } ]      
      CurrencyCode,
      
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Description,
      Status,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      
      /* Transient Data */
      StatusCriticality,
      CustomerName,
      
      //Associations
      
      _Bookings : redirected to composition child ZC_11_BookingTP
}
