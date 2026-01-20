@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 8: Associations'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z11_Demo08
  as select from /dmo/connection as c

  association [1..1] to /dmo/carrier as _Carrier
    on $projection.CarrierId = _Carrier.carrier_id

  association [0..*] to /dmo/flight  as _Flights
    on  _Flights.carrier_id    = $projection.CarrierId
    and _Flights.connection_id = $projection.ConnectionId

{
  key carrier_id as CarrierId,
  key connection_id              as ConnectionId,
      airport_from_id            as AirportFromId,
      airport_to_id              as AiportToId,
      
      /* Associations */
      _Carrier,
      _Flights
}
